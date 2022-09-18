import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

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
                Image.asset(
                  'lib/assets/images/profile.png',
                  width: 40,
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
                Text("Latest Report"),
                Text("50%"),
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
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Heart Analysis"),
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
                // gradient: primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),
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
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
