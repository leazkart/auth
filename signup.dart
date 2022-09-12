import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leazkart_app/themes/colors.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DateTime _date = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('MMM dd, yyyy');

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: _date);
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormat.format(date);
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: loginButton(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset('assets/images/lklogoclear.png',
                            height: 30),
                      ),
                      Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Already have an account?"),
                          GestureDetector(
                            child: Text(
                              "Sign In here!",
                              style: TextStyle(
                                color: Color(0xFF4B48C9),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                  inputFile(label: 'Full Name'),
                  dateFormField(label: 'Date of Birth'),
                  inputFile(label: "Phone"),
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          activeColor: AppColors.colors.lkGreen,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('I am over the age of 18')
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateFormField({label}) {
    return Column(
      children: [
        TextFormField(
          readOnly: true,
          controller: _dateController,
          onTap: _handleDatePicker,
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: label,
            fillColor: AppColors.colors.lkPurplyWhite,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: AppColors.colors.lkPurple,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: AppColors.colors.lkPurplyWhite,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }

// we will be creating a widget for text field
  Widget inputFile({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
            obscureText: obscureText,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: label,
              fillColor: AppColors.colors.lkPurplyWhite,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppColors.colors.lkPurple,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppColors.colors.lkPurplyWhite,
                  width: 2.0,
                ),
              ),
            )),
        SizedBox(height: 15)
      ],
    );
  }

  Padding loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {},
        color: AppColors.colors.lkPurple,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
