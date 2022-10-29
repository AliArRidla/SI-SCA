import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:si_sca/utils/theme.dart';
import 'package:si_sca/views/home/home.dart';
import 'package:si_sca/views/monitor/monitor.dart';
import 'package:si_sca/views/profile/profile.dart';
import 'package:si_sca/views/report/report.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedNavbar = 0;
  final _screens = [
    HomeScreen(),
    MonitorScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    void _changeSelectedNavbar(int index) {
      setState(() {
        selectedNavbar = index;
        print(selectedNavbar);
      });
    }

    return Scaffold(
      body: _screens[selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedNavbar,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.waveform),
            label: 'Monitor',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_on_clipboard_fill),
            label: 'Report',
          ),
        ],
        selectedItemColor: primaryColor,
        onTap: _changeSelectedNavbar,
      ),
    );
  }
}
