import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leazkart_app/AuthScreens/signup.dart';
import 'package:leazkart_app/themes/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            Image.asset(
              'assets/images/signin.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset('assets/images/lklogoclear.png',
                            height: 30),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          GestureDetector(
                              child: Text(
                                "Register here!",
                                style: TextStyle(
                                  color: Color(0xFF4B48C9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              })
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  inputFile(label: "Phone"),
                ],
              ),
            ),
          ],
        ),
      ),
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

// we will be creating a widget for text field
Widget inputFile({label}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextFormField(
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
      SizedBox(height: 10),
    ],
  );
}
