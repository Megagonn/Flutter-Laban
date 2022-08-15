import 'dart:io';

import 'package:flutter/material.dart';
import 'package:laban/ui/home.dart';
import 'package:laban/ui/landing.dart';
import 'package:laban/ui/login.dart';
import 'package:laban/ui/signup.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landing(),
      // Home(),
      // Login()
      // SignUp(),
      routes: {
        '/': (context) => const Landing(),
      },
    );
  }
}
