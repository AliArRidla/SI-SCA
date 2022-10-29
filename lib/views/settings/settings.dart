import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Settings"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'lib/assets/images/profile_detail.png',
                width: 100,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null,
                controller: _nameController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: thirdColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Username",
                  hintText: "Silahkan masukkan username anda",
                  hintStyle: textBody.copyWith(color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null,
                controller: _emailController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: thirdColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email",
                  hintText: "Silahkan masukkan email anda",
                  hintStyle: textBody.copyWith(color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null,
                controller: _ageController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: thirdColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Umur",
                  hintText: "Silahkan masukkan umur anda",
                  hintStyle: textBody.copyWith(color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null,
                controller: _genderController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: thirdColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Gender",
                  hintText: "Silahkan masukkan gender anda",
                  hintStyle: textBody.copyWith(color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty
                    ? "Tidak boleh kosong"
                    : null,
                controller: _weightController,
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: thirdColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),

                  // border: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Weight",
                  hintText: "Silahkan masukkan berat anda",
                  hintStyle: textBody.copyWith(color: secondaryColor),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                // color: Colors.transparent,
                // elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: primaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Save Settings",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
