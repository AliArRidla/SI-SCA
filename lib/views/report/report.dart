import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: textSubHeading,
        ),
        foregroundColor: primaryColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu',
                          style: satuTextStyle.copyWith(
                              fontSize: 15, color: Colors.white),
                        ),
                        Text(
                          '20',
                          style: duaTextStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // color: Colors.white,
                        gradient: primaryGradient),
                    width: 60,
                    height: 100,
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                "List report",
                style: satuTextStyle.copyWith(fontSize: 20),
              ),
            ),
            // ListView()
            Expanded(
                child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 200, 200, 200).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // gradient: secondaryColor
                  ),
                  width: width,
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: textBody.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text("22 Feb 2022"),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time",
                                        style: textBody.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text("20.00 WIB"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 200, 200, 200).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // gradient: secondaryColor
                  ),
                  width: width,
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: textBody.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Text("22 Feb 2022"),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time",
                                        style: textBody.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text("20.00 WIB"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
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
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
