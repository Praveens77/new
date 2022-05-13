import 'package:flutter/material.dart';
import 'package:menem_2/constants.dart';
import 'package:menem_2/splash_screen.dart';
void main()=>runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
      home: SplashScreen(),
    );
  }
}
