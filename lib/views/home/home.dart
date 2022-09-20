import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';
import 'package:si_sca/views/profile/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.only(top: 90, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello"),
                    Text("Vandy"),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                  },
                  child: Image.asset(
                    'lib/assets/images/profile.png',
                    width: 40,
                  ),
                )
                // Image.asset("name")
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Latest Report",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                Text("50%",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 175,
              // width: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.blue,
                gradient: primaryGradient,
                // borderRadius: BorderRadius.circular(20),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
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
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text("Heart Rate",
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("96",
                                style: TextStyle(
                                    fontSize: 50, color: Colors.white)),
                            Text("bpm",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      'lib/assets/images/rate.png',
                      width: 120,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Heart Analysis",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 175,
                  // width: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 200, 200, 200).withOpacity(0.1),
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
                      children: [Text("Status")],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Monitor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Report',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
