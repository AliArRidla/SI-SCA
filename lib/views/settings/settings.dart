import 'package:flutter/material.dart';
import 'package:si_sca/utils/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
              // Row(
              //   children: [
              //     TextFormField(
              //       decoration: const InputDecoration(
              //         icon: Icon(Icons.person),
              //         hintText: 'What do people call you?',
              //         labelText: 'Name *',
              //       ),
              //       onSaved: (String? value) {
              //         // This optional block of code can be used to run
              //         // code when the user saves the form.
              //       },
              //       validator: (String? value) {
              //         return (value != null && value.contains('@'))
              //             ? 'Do not use the @ char.'
              //             : null;
              //       },
              //     ),
              //     TextFormField(
              //       decoration: const InputDecoration(
              //         icon: Icon(Icons.person),
              //         hintText: 'What do people call you?',
              //         labelText: 'Name *',
              //       ),
              //       onSaved: (String? value) {
              //         // This optional block of code can be used to run
              //         // code when the user saves the form.
              //       },
              //       validator: (String? value) {
              //         return (value != null && value.contains('@'))
              //             ? 'Do not use the @ char.'
              //             : null;
              //       },
              //     )
              //   ],
              // ),

              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Email Address *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Age *',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Gender*',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Weight*',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                onPressed: () {},
                color: Colors.transparent,
                elevation: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: primaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
