import 'package:flutter/material.dart';
import 'package:leazkart_app/AuthScreens//signin.dart';
import 'package:leazkart_app/themes/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SignIn(),
      theme: ThemeData(
        fontFamily: 'Jost',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: AppColors.colors.lkPurple),
      ),
    );
  }
}
