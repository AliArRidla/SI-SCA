import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
