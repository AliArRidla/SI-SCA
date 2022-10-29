import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:si_sca/shared/circle_progress.dart';
import 'package:si_sca/shared/theme.dart';
import 'package:si_sca/utils/fl_chart.dart';
import 'package:si_sca/utils/theme.dart';
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
  final String ECG_UUID = "0000183e-0000-1000-8000-00805f9b34fb";
  final String ECG_C_UUID = "00002a58-0000-1000-8000-00805f9b34fb";

  // ECG 2
  final String ECG2_UUID = "00001813-0000-1000-8000-00805f9b34fb";
  final String ECG2_C_UUID = "00002a58-0000-1000-8000-00805f9b34fb";

  // COND
  final String COND_UUID = "0000181a-0000-1000-8000-00805f9b34fb";
  final String COND_C_UUID = "0000290c-0000-1000-8000-00805f9b34fb";

  bool isReady;
  // Stream<List<int>> stream;
  Stream<List<int>> streamService;
  Stream<List<int>> streamBattery;
  Stream<List<int>> streamECG;
  Stream<List<int>> streamECG2;
  Stream<List<int>> streamCOND;
  List<double> traceDustService = List();
  List<double> traceDustECG = List();

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
    // discoverBattery(); //ok
    // discoverECG();
    discoverECG2();
    // discoverCOND(); //ok
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

  discoverECG2() async {
    if (widget.device == null) {
      _Pop();
      return;
    }

    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      if (service.uuid.toString() == ECG2_UUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == ECG2_C_UUID) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            streamECG2 = characteristic.value;

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
            new AlertDialog(
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

  int time = 19;
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
      LiveData(18, 94)
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var dataMap = streamECG2;

    final colorList = <Color>[primaryColor];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Monitor",
          style: textSubHeading,
        ),
        foregroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: !isReady
            ? Center(
                child: Text(
                  "Menyambungkan",
                  style: duaTextStyle,
                ),
              )
            : Container(
                child: StreamBuilder<List<int>>(
                    stream: streamService,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<int>> snapshot) {
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');

                      if (snapshot.connectionState == ConnectionState.active) {
                        var currentValue = _dataParser(snapshot.data);
                        // print(currentValue);
                        traceDustService
                            .add(double.tryParse(currentValue) ?? 0);
                        var dataMap = <String, double>{
                          "Jantung": traceDustService.last,
                        };
                        return Center(
                          child: ListView(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      child: CustomPaint(
                                        foregroundPainter: CircleProgress(
                                            traceDustService.last, false),
                                        child: Container(
                                          width: 200,
                                          height: 200,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('BPM'),
                                                Text(
                                                  '${traceDustService.last}',
                                                  style: satuTextStyle,
                                                ),
                                                Text(
                                                  '%',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                                  SizedBox(
                                    height: 45,
                                  ),
                                  // Text('${snapshot.data}ug/m3'),
                                  // Text('${currentValue}ug/m3'),
                                  // SizedBox(
                                  //   height: 45,
                                  // ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: StreamBuilder<List<int>>(
                                        stream: streamECG2,
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<int>> snapshot) {
                                          if (snapshot.hasError)
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          if (snapshot.connectionState ==
                                              ConnectionState.active) {
                                            var currentValue =
                                                _dataParser(snapshot.data);
                                            // print(currentValue);
                                            traceDustECG.add(
                                                double.tryParse(currentValue) ??
                                                    0);
                                            var dataMap = <String, double>{
                                              "Jantung": traceDustECG.last,
                                            };
                                            return Container(
                                              child: SfCartesianChart(
                                                series: <
                                                    LineSeries<LiveData, int>>[
                                                  LineSeries<LiveData, int>(
                                                    onRendererCreated:
                                                        (ChartSeriesController
                                                            controller) {
                                                      _chartSeriesController =
                                                          controller;
                                                    },
                                                    dataSource: chartData,
                                                    color: primaryColor,
                                                    xValueMapper:
                                                        (LiveData sales, _) =>
                                                            sales.time,
                                                    yValueMapper:
                                                        (LiveData sales, _) =>
                                                            sales.speed,
                                                  ),
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

                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
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
                                                    const Duration(seconds: 1),
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Text('Check the stream');
                      }
                    }),
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
