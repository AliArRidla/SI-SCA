import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:si_sca/views/device/widgets.dart';

class DeviceDetailScreen extends StatelessWidget {
  const DeviceDetailScreen({Key key, this.device}) : super(key: key);
  final BluetoothDevice device;

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
            service: s,
            characteristicTiles: s.characteristics
                .map(
                  (c) => CharacteristicTile(
                    characteristic: c,
                    onReadPressed: () => c.read(),
                    onWritePressed: () => c.write([13, 24]),
                    onNotificationPressed: () =>
                        c.setNotifyValue(!c.isNotifying),
                    descriptorTiles: c.descriptors
                        .map(
                          (d) => DescriptorTile(
                            descriptor: d,
                            onReadPressed: () => d.read(),
                            onWritePressed: () => d.write([11, 12]),
                          ),
                        )
                        .toList(),
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) => ListTile(
              leading: (snapshot.data == BluetoothDeviceState.connected)
                  ? Icon(Icons.bluetooth_connected)
                  : Icon(Icons.bluetooth_disabled),
              title:
                  Text('Device is ${snapshot.data.toString().split('.')[1]}.'),
              subtitle: Text('${device.id}'),
              trailing: StreamBuilder<bool>(
                stream: device.isDiscoveringServices,
                initialData: false,
                builder: (c, snapshot) => IndexedStack(
                  // index: snapshot.data ? 1 : 0,
                  index: snapshot.data != null ? 1 : 0,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () => device.discoverServices(),
                    ),
                    IconButton(
                      icon: SizedBox(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                        width: 18.0,
                        height: 18.0,
                      ),
                      onPressed: null,
                    )
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder<int>(
            stream: device.mtu,
            initialData: 0,
            builder: (c, snapshot) => ListTile(
              title: Text('MTU Size'),
              subtitle: Text('${snapshot.data} bytes'),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => device.requestMtu(223),
              ),
            ),
          ),
          StreamBuilder<List<BluetoothService>>(
            stream: device.services,
            initialData: [],
            builder: (c, snapshot) {
              return Column(
                children: _buildServiceTiles(snapshot.data??[]),
              );
            },
          ),
        ],
      ),
    );
  }
}
