import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:si_sca/utils/theme.dart';
import 'package:si_sca/views/device/device_detail.dart';
import 'package:si_sca/views/device/device_list.dart';
import 'package:si_sca/views/device/find_device.dart';
import 'package:si_sca/views/device/widgets.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ini Main"),
      ),
      body: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (context, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDeviceScreen();
            }
            // return Container();
            return BluetoothOffScreen(state: state);
            // return Container();
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);
  final BluetoothState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text('Bluetooth Adapter is ${state.toString().substring(15)}.',
                style: satuTextStyle),
          ],
        ),
      ),
    );
  }
}
