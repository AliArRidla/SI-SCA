import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Configuration"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 200,
                height: 200,
                decoration: ShapeDecoration(
                  // color: Colors.blue,
                  gradient: primaryGradient,
                  shape: CircleBorder(),
                ),
                child: Center(
                  child: Text("SCAN",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            Container(
              height: 300,
              // color: Colors.grey,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 200, 200, 200).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Connect on device", style: TextStyle(fontSize: 25)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 113, 113, 113)
                                .withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'lib/assets/images/logo.png',
                            width: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SCA-1A", style: TextStyle(fontSize: 25)),
                                Icon(Icons.battery_full),
                              ]),
                          Icon(Icons.check_circle)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
