import 'package:flutter/material.dart';
import 'package:gesturb/global/colors.dart';
import 'package:gesturb/providers/auth_provider.dart';
import 'package:gesturb/providers/list_provider.dart';
import 'package:gesturb/screens/login/login.dart';
import 'package:gesturb/screens/onboarding.dart';
import 'package:gesturb/screens/password/new_password.dart';
import 'package:gesturb/screens/password/password_forgotten.dart';
import 'package:gesturb/screens/register/register.dart';

import 'package:provider/provider.dart';


void main() {
    runApp(const MyApp());

  /* runApp(
    MultiProvider(
      providers: providerList,
      child: const MyApp(),
    ),
  ); */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ...
        home: Register(),
      
    );
  }
}

 