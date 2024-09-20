import 'package:flutter/material.dart';
import 'package:firebase_tutorial/screen/pages/login/login.dart';
import 'package:firebase_tutorial/screen/pages/signup/signup.dart';
import 'package:firebase_tutorial/screen/pages/home/home.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginPage(), // Ensure this line is present
  '/login': (context) => LoginPage(),
  '/signup': (context) => SignUpPage(),
  '/home': (context) => HomePage(),
};
