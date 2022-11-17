import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:si_sca/shared/circle_progress.dart';
import 'package:si_sca/shared/theme.dart';
import 'package:si_sca/utils/fl_chart.dart';
import 'package:si_sca/utils/theme.dart';
import 'package:si_sca/views/device/device_revision.dart';
import 'package:si_sca/views/home/main.dart';
import 'dart:math' as math;
import 'dart:convert' show utf8;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MonitorScreen extends StatefulWidget {
  const MonitorScreen({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  @override
  State<MonitorScreen> createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  // UUID
  final String SERVICE_UUID = "0000180d-0000-1000-8000-00805f9b34fb";
  final String CHARACTERISTIC_UUID = "00002a37-0000-1000-8000-00805f9b34fb";

  // BATTERY
  final String BATT_UUID = "0000180f-0000-1000-8000-00805f9b34fb";
  final String BATT_C_UUID = "00002a19-0000-1000-8000-00805f9b34fb";

  // ECG
  final String ECG_UUID = "0000181a-0000-1000-8000-00805f9b34fb";
  final String ECG_C_UUID = "00002a58-0000-1000-8000-00805f9b34fb";

  // AI
  final String AI_UUID = "0000183e-0000-1000-8000-00805f9b34fb";
  final String AI_C_UUID = "00002b3b-0000-1000-8000-00805f9b34fb";

  // COND
  final String COND_UUID = "0000183e-0000-1000-8000-00805f9b34fb";
  final String COND_C_UUID = "0000290c-0000-1000-8000-00805f9b34fb";

  bool isReady;
  // Stream<List<int>> stream;
  Stream<List<int>> streamService;
  Stream<List<int>> streamBattery;
  Stream<List<int>> streamECG;
  Stream<List<int>> streamAI;
  Stream<List<int>> streamCOND;
  List<double> traceDustService = List();
  List<double> traceDustECG = List();
  List<int> traceDustCOND = List();
  List<int> traceDustBattery = List();

  // @override
  // void initState() {

  //   // Timer.periodic(const Duration(seconds: 1), updateDataSource);
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    isReady = false;
    connectToDevice();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady) {
        disconnectFromDevice();
        _Pop();
      }
    });

    await widget.device.connect();
    discoverServices(); //ok
    discoverBattery(); //ok
    discoverECG();
    discoverAI();
    discoverCOND(); //ok
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _Pop();
      return;
    }

    widget.device.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == SERVICE_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == CHARACTERISTIC_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamService = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  discoverBattery() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == BATT_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == BATT_C_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamBattery = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  discoverECG() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == ECG_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == ECG_C_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamECG = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  discoverAI() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == AI_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == AI_C_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamAI = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  discoverCOND() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == COND_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == COND_C_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamCOND = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady) {
      _Pop();
    }
  }

  _Pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to disconnect device and go back?'),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('No')),
                ElevatedButton(
                    onPressed: () {
                      disconnectFromDevice();
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Yes')),
              ],
            ) ??
            false);
  }

  List<LiveData> chartData;
  // List<int, int> chartData2 ;
  ChartSeriesController _chartSeriesController;

  int time = 30;
  void updateDataSource(Timer timer) {
    // chartData.add(LiveData(time++, (math.Random().nextInt(60) + 30)));
    chartData.add(LiveData(time++, (traceDustECG.last)));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94),
      LiveData(19, 72),
      LiveData(20, 86),
      LiveData(21, 52),
      LiveData(22, 94),
      LiveData(23, 92),
      LiveData(24, 86),
      // LiveData(25, 72),
      // LiveData(26, 94),
      // LiveData(27, 86),
      // LiveData(28, 72),
      // LiveData(29, 94),
      // LiveData(30, 21)
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var dataMap = streamECG2;

    final colorList = <Color>[primaryColor];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Monitor",
      //     style: textSubHeading,
      //   ),
      //   foregroundColor: primaryColor,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => MainScreen(),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.arrow_back),
      ),
      body: Container(
        child: !isReady
            ? Center(
                child: Text(
                  "Menyambungkan",
                  style: duaTextStyle,
                ),
              )
            :
            // RotatedBox(
            //     quarterTurns: 3,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: [
            //             Container(
            //               padding: EdgeInsets.only(left: 90, right: 20),
            //               child: CustomPaint(
            //                 foregroundPainter:
            //                     // CircleProgress(traceDustService.last, false),
            //                     CircleProgress(90, false),
            //                 child: Container(
            //                   width: 130,
            //                   height: 130,
            //                   child: Center(
            //                     child: Column(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: <Widget>[
            //                         Text('BPM'),
            //                         Text(
            //                           '${90}',
            //                           style: tigaTextStyle,
            //                         ),
            //                         // Text(
            //                         //   '%',
            //                         //   style: TextStyle(
            //                         //       fontSize: 10,
            //                         //       fontWeight: FontWeight.bold),
            //                         // ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       "Status",
            //                       style: textBody.copyWith(
            //                         fontWeight: FontWeight.bold,
            //                         color: primaryColor,
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 10,
            //                     ),
            //                     Text(" - Your heart is in bad condition"),
            //                     SizedBox(
            //                       height: 5,
            //                     ),
            //                     Text(" - Heart rate is too high"),
            //                     SizedBox(
            //                       height: 10,
            //                     ),
            //                     Row(
            //                       children: [
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Condition",
            //                               style: textBody.copyWith(
            //                                   fontWeight: FontWeight.bold,
            //                                   color: primaryColor),
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text("Fall"),
            //                           ],
            //                         ),
            //                         SizedBox(
            //                           width: 10,
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(
            //                               "Disease",
            //                               style: textBody.copyWith(
            //                                   fontWeight: FontWeight.bold,
            //                                   color: primaryColor),
            //                             ),
            //                             SizedBox(
            //                               height: 10,
            //                             ),
            //                             Text(" - Ventricular fibrillation"),
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               padding: const EdgeInsets.symmetric(vertical: 10),
            //               child: Center(
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     gradient: primaryGradient,
            //                   ),
            //                   child: CircleAvatar(
            //                     radius: 30,
            //                     child: IconButton(
            //                       onPressed: (() {
            //                         // setState(() {
            //                         //   Timer.periodic(
            //                         //       const Duration(milliseconds: 20),
            //                         //       updateDataSource);
            //                         // });
            //                       }),
            //                       icon: Icon(
            //                         CupertinoIcons.play_fill,
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                     backgroundColor: Colors.transparent,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //         Expanded(
            //             // child: SfCartesianChart(
            //             //     plotAreaBorderWidth: 0,
            //             //     primaryXAxis: NumericAxis(
            //             //         majorGridLines: const MajorGridLines(width: 0)),
            //             //     primaryYAxis: NumericAxis(
            //             //         axisLine: const AxisLine(width: 0),
            //             //         majorTickLines: const MajorTickLines(size: 0)),
            //             //     series: <LineSeries<LiveData, int>>[
            //             //       LineSeries<LiveData, int>(
            //             //         onRendererCreated:
            //             //             (ChartSeriesController controller) {
            //             //           _chartSeriesController = controller;
            //             //         },
            //             //         dataSource: chartData,
            //             //         color: const Color.fromRGBO(192, 108, 132, 1),
            //             //         xValueMapper: (LiveData sales, _) => sales.time,
            //             //         yValueMapper: (LiveData sales, _) => sales.speed,
            //             //         animationDuration: 0,
            //             //       )
            //             //     ]),
            //             child: SfCartesianChart(series: <ChartSeries>[
            //           SplineSeries<LiveData, int>(
            //             dataSource: chartData,
            //             // Type of spline
            //             splineType: SplineType.cardinal,
            //             cardinalSplineTension: 0.9,
            //             // xValueMapper: (ChartData data, _) => data.x,
            //             // yValueMapper: (ChartData data, _) => data.y
            //             color: primaryColor,
            //             xValueMapper: (LiveData sales, _) => sales.time,
            //             yValueMapper: (LiveData sales, _) => sales.speed,
            //           )
            //         ])),
            //       ],
            //     ),
            //   ),
            Container(
                child:
                    // StreamBuilder<List<int>>(
                    //     stream: streamService,
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<List<int>> snapshot) {
                    //       if (snapshot.hasError)
                    //         return Text('Error: ${snapshot.error}');

                    //       if (snapshot.connectionState == ConnectionState.active) {
                    //         var currentValue = _dataParser(snapshot.data);
                    //         // print(currentValue);
                    //         traceDustService
                    //             .add(double.tryParse(currentValue) ?? 0);
                    //         var dataMap = <String, double>{
                    //           "Jantung": traceDustService.last,
                    //         };
                    //         return
                    RotatedBox(
                quarterTurns: 3,
                // angle: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<List<int>>(
                            stream: streamService,
                            builder: (context, snapshot) {
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');

                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var currentValue = _dataParser(snapshot.data);
                                // print(currentValue);
                                traceDustService
                                    .add(double.tryParse(currentValue) ?? 0);
                                var dataMap = <String, double>{
                                  "Jantung": traceDustService.last,
                                };
                                return Container(
                                  child: CustomPaint(
                                    foregroundPainter: CircleProgress(
                                        traceDustService.last, false),
                                    child: Container(
                                      width: 130,
                                      height: 130,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('BPM'),
                                            Text(
                                              '${traceDustService.last}',
                                              style: tigaTextStyle,
                                            ),
                                            // Text(
                                            //   '%',
                                            //   style: TextStyle(
                                            //       fontSize: 10,
                                            //       fontWeight:
                                            //           FontWeight.bold),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Text('Check the stream');
                              }
                            }),
                        StreamBuilder<List<int>>(
                            stream: streamCOND,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<int>> snapshot) {
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');

                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var currentValue = _dataParser(snapshot.data);
                                // print(currentValue);
                                // traceDustCOND
                                // .add(double.tryParse(currentValue) ?? 0);
                                // var dataMap = <String, double>{
                                //   "Jantung": traceDustCOND.last,
                                // };
                                return Column(
                                  children: [
                                    Text(
                                      "Condition",
                                      style: textBody.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${currentValue}',
                                    ),
                                  ],
                                );
                              } else {
                                return Text('Check the stream');
                              }
                            }),

                        StreamBuilder<List<int>>(
                            stream: streamAI,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<int>> snapshot) {
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');

                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var currentValue = _dataParser(snapshot.data);
                                // print(currentValue);
                                // traceDustCOND
                                // .add(double.tryParse(currentValue) ?? 0);
                                // var dataMap = <String, double>{
                                //   "Jantung": traceDustCOND.last,
                                // };
                                return Column(
                                  children: [
                                    Text(
                                      "Disease",
                                      style: textBody.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${currentValue}',
                                    ),
                                  ],
                                );
                              } else {
                                return Text('Check the stream');
                              }
                            }),

                        // Column(
                        //   children: [
                        //     Text(
                        //       "Disease",
                        //       style: textBody.copyWith(
                        //         fontWeight: FontWeight.bold,
                        //         color: primaryColor,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text(
                        //         // '${traceDustService.last}',
                        //         "io"),
                        //   ],
                        // ),
                        StreamBuilder<List<int>>(
                            stream: streamBattery,
                            builder: (BuildContext context,
                                AsyncSnapshot<List<int>> snapshot) {
                              if (snapshot.hasError)
                                return Text('Error: ${snapshot.error}');

                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var currentValue = _dataParser(snapshot.data);
                                print(currentValue);
                                traceDustBattery
                                    .add(int.tryParse(currentValue) ?? 0);
                                // var dataMap = <String, double>{
                                //   "Jantung": traceDustBattery.last,
                                // };
                                return Column(
                                  children: [
                                    Text(
                                      "Battery",
                                      style: textBody.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${traceDustBattery.last}',
                                    ),
                                  ],
                                );
                              } else {
                                return Text('Check the stream');
                              }
                            }),
                        // Column(
                        //   children: [
                        //     Text(
                        //       "Battery",
                        //       style: textBody.copyWith(
                        //         fontWeight: FontWeight.bold,
                        //         color: primaryColor,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Text(
                        //       '${traceDustService.last}',
                        //     ),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: primaryGradient,
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                child: IconButton(
                                  onPressed: (() {
                                    setState(() {
                                      Timer.periodic(
                                          const Duration(milliseconds: 20),
                                          updateDataSource);
                                    });
                                  }),
                                  icon: Icon(
                                    CupertinoIcons.play_fill,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Container(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 46),
                    //   child: PieChart(
                    //     dataMap: dataMap,
                    //     chartType: ChartType.ring,
                    //     baseChartColor:
                    //         Color.fromARGB(255, 147, 147, 147)
                    //             .withOpacity(0.15),
                    //     colorList: colorList,
                    //     chartValuesOptions: ChartValuesOptions(
                    //       showChartValuesInPercentage: true,
                    //     ),
                    //     totalValue: 130,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Text('${snapshot.data}ug/m3'),
                    // Text('${currentValue}ug/m3'),
                    // SizedBox(
                    //   height: 45,
                    // ),
                    Expanded(
                      // height: MediaQuery.of(context).size.width,
                      // margin:
                      //     EdgeInsets.symmetric(horizontal: 20),
                      child: StreamBuilder<List<int>>(
                          stream: streamECG,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<int>> snapshot) {
                            if (snapshot.hasError)
                              return Text('Error: ${snapshot.error}');
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              var currentValue = _dataParser(snapshot.data);
                              // print(currentValue);
                              traceDustECG
                                  .add(double.tryParse(currentValue) ?? 0);
                              var dataMap = <String, double>{
                                "Jantung": traceDustECG.last,
                              };
                              return Container(
                                child: SfCartesianChart(
                                  series: <SplineSeries<LiveData, int>>[
                                    SplineSeries<LiveData, int>(
                                      dataSource: chartData,
                                      onRendererCreated:
                                          (ChartSeriesController controller) {
                                        _chartSeriesController = controller;
                                      },
                                      // Type of spline
                                      splineType: SplineType.cardinal,
                                      cardinalSplineTension: 0.9,
                                      // xValueMapper: (ChartData data, _) => data.x,
                                      // yValueMapper: (ChartData data, _) => data.y
                                      color: primaryColor,
                                      xValueMapper: (LiveData sales, _) =>
                                          sales.time,
                                      yValueMapper: (LiveData sales, _) =>
                                          sales.speed,
                                    )
                                  ],

                                  // primaryXAxis: NumericAxis(
                                  //     majorGridLines:
                                  //         const MajorGridLines(width: 0),
                                  //     edgeLabelPlacement:
                                  //         EdgeLabelPlacement.shift,
                                  //     interval: 3,
                                  //     title: AxisTitle(
                                  //         text: 'Time (seconds)')),
                                  // primaryYAxis: NumericAxis(
                                  //     axisLine: const AxisLine(width: 0),
                                  //     majorTickLines:
                                  //         const MajorTickLines(size: 0),
                                  //     title: AxisTitle(
                                  //         text: 'Internet speed (Mbps)')),
                                ),
                              );
                            } else {
                              return Text('Check the stream');
                            }
                          }),
                    ),
                    // StreamBuilder<List<int>>(
                    //     stream: streamECG,
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<List<int>> snapshot) {
                    //       if (snapshot.hasError)
                    //         return Text(
                    //             'Error: ${snapshot.error}');
                    //       if (snapshot.connectionState ==
                    //           ConnectionState.active) {
                    //         var currentValue =
                    //             _dataParser(snapshot.data);
                    //         print(currentValue);
                    //         traceDustService.add(
                    //             double.tryParse(currentValue) ??
                    //                 0);
                    //         return Container(
                    //           child: Text('${currentValue}ECG'),
                    //         );
                    //       } else {
                    //         return Text('Check the stream');
                    //       }
                    //     }),

                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              )
                //   } else {
                //     return Text('Check the stream');
                //   }
                // }
                // ),
                ),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );
  final String x;
  final double y;
  Color color;
}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
