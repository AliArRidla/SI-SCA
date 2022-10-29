import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24;

// font style
// heading
TextStyle textHeading = TextStyle(
  fontSize: 27,
  color: Colors.black,
);
// subheading
TextStyle textSubHeading = TextStyle(
  fontSize: 20,
  color: Colors.black,
);
// body
TextStyle textBody = TextStyle(
  fontSize: 16,
  color: Colors.black,
);

LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color(0xff3BA59B),
    Color(0xff5CCB97),
  ],
);

Color primaryColor = Color(0xff3BA59B);
Color secondaryColor = Color.fromARGB(255, 169, 174, 174);
Color thirdColor = Color.fromARGB(255, 239, 239, 239);

Color primaryTextColor = Color(0xff474747);
Color secondaryTextColor = Color(0xffB4B4B4);

// satu
TextStyle satuTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w600,
  fontSize: 40,
);

//
TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

TextStyle textButtonTextStyle = GoogleFonts.poppins(
  color: primaryColor,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);

TextStyle headingTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 20,
);

// tiga
TextStyle duaTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

// dua
TextStyle tigaTextStyle = GoogleFonts.poppins(
    color: secondaryTextColor, fontWeight: FontWeight.w400, fontSize: 12);

// tiga
TextStyle empatTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 11,
);

// tiga
TextStyle limaTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.w300,
  fontSize: 9,
);