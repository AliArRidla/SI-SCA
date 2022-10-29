import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_sca/utils/theme.dart';
import 'package:si_sca/views/monitor/monitor.dart';
import 'package:si_sca/views/profile/profile.dart';
import 'package:si_sca/views/report/report.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: textSubHeading,
        ),
        foregroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hello",
                          style: textSubHeading.copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'lib/assets/icons/hello.png',
                          width: 20,
                        ),
                      ],
                    ),
                    Text(
                      "Vandy",
                      style: textHeading.copyWith(
                          fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: IconButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    }),
                    icon: Icon(
                      CupertinoIcons.person_fill,
                      color: primaryColor,
                    ),
                  ),
                ),
                //   child: Image.asset(
                //     'lib/assets/images/profile.png',
                //     width: 50,
                //   ),
                // )
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
                    style: textBody.copyWith(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.battery_25_percent,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("50%",
                        style: textBody.copyWith(
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
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
                                    fontSize: 46, color: Colors.white)),
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
                    style: textBody.copyWith(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  // height: MediaQuery.of(context).size.width - 120,
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
                    // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status",
                            style: textBody.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(" - Your heart is in bad condition"),
                          SizedBox(
                            height: 5,
                          ),
                          Text(" - Heart rate is too high"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Disease",
                            style: textBody.copyWith(
                                fontWeight: FontWeight.bold,
                                color: primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(" - Ventricular fibrillation"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
