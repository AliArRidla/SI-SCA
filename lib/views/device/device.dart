// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';
// // import 'package:flutter_blue/gen/flutterblue.pb.dart';
// import 'package:si_sca/utils/theme.dart';


// class DeviceScreen extends StatelessWidget {
//   const DeviceScreen({Key? key}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Device Configuration"),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//       ),
//       body: StreamBuilder<BluetoothState>(
//         stream: FlutterBlue.instance.state,
//         initialData: BluetoothState.unknown,
//         builder: (context, snapshot) {
          
//           return Center(
//             child: Expanded(
//               child: InkWell(
//                 onTap: () => FlutterBlue.instance.startScan(timeout: Duration(seconds: 4)),
//                 child: Container(
//                   width: 200,
//                   height: 200,
//                   decoration: ShapeDecoration(
//                     // color: Colors.blue,
//                     gradient: primaryGradient,
//                     shape: CircleBorder(),
//                   ),
//                   child: listDeviceModal(),
//                 ),
//               ),
//             ),
//             // Container(
//             //   height: 300,
//             //   // color: Colors.grey,
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
//             //     boxShadow: [
//             //       BoxShadow(
//             //         color: Color.fromARGB(255, 200, 200, 200).withOpacity(0.1),
//             //         spreadRadius: 5,
//             //         blurRadius: 7,
//             //         offset: Offset(0, 3), // changes position of shadow
//             //       ),
//             //     ],
//             //   ),
//             // )
//           );
//         }
//       ),
//     );
//   }
// }

// class listDeviceModal extends StatelessWidget {
//   const listDeviceModal({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Connect on device", style: TextStyle(fontSize: 25)),
//                     SizedBox(
//                       height: 20,
//                     ),SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               StreamBuilder<List<BluetoothDevice>>(
//                 stream: Stream.periodic(Duration(seconds: 2))
//                     .asyncMap((_) => FlutterBlue.instance.connectedDevices),
//                 initialData: [],
//                 builder: (c, snapshot) => Column(
//                   children: snapshot.data
//                       .map((d) => ListTile(
//                             title: Text(d.name),
//                             subtitle: Text(d.id.toString()),
//                             trailing: StreamBuilder<BluetoothDeviceState>(
//                               stream: d.state,
//                               initialData: BluetoothDeviceState.disconnected,
//                               builder: (c, snapshot) {
//                                 if (snapshot.data ==
//                                     BluetoothDeviceState.connected) {
//                                   return ElevatedButton(
//                                     child: Text('OPEN'),
//                                     onPressed: () => Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 DeviceScreen(device: d))),
//                                   );
//                                 }
//                                 return Text(snapshot.data.toString());
//                               },
//                             ),
//                           ))
//                       .toList(),
//                 ),
//               ),
//               StreamBuilder<List<ScanResult>>(
//                 stream: FlutterBlue.instance.scanResults,
//                 initialData: [],
//                 builder: (c, snapshot) => Column(
//                   children: snapshot.data
//                       .map(
//                         (r) => ScanResultTile(
//                           result: r,
//                           onTap: () => Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             r.device.connect();
//                             return SensorPage(device: r.device);
//                           })),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),



//                     // Container(
//                     //   // margin: EdgeInsets.symmetric(horizontal: 30),
//                     //   padding: EdgeInsets.symmetric(vertical: 20),
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.white,
//                     //     borderRadius: BorderRadius.only(
//                     //         topLeft: Radius.circular(15),
//                     //         topRight: Radius.circular(15),
//                     //         bottomLeft: Radius.circular(15),
//                     //         bottomRight: Radius.circular(15)),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //         color: Color.fromARGB(255, 113, 113, 113)
//                     //             .withOpacity(0.1),
//                     //         spreadRadius: 5,
//                     //         blurRadius: 7,
//                     //         offset: Offset(0, 3), // changes position of shadow
//                     //       ),
//                     //     ],
//                     //   ),
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //     children: [
//                     //       Image.asset(
//                     //         'lib/assets/images/logo.png',
//                     //         width: 50,
//                     //       ),
//                     //       SizedBox(
//                     //         width: 10,
//                     //       ),
//                     //       Column(
//                     //           crossAxisAlignment: CrossAxisAlignment.start,
//                     //           children: [
//                     //             Text("SCA-1A", style: TextStyle(fontSize: 25)),
//                     //             Icon(Icons.battery_full),
//                     //           ]),
//                     //       Icon(Icons.check_circle)
//                     //     ],
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               );
//             });
//       },
//       child: Center(
//         child: Text("SCAN",
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             )),
//       ),
//     );
//   }
// }
