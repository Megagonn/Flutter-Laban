import 'dart:io';

import 'package:flutter/material.dart';
import 'package:laban/providers/count_provider.dart';
import 'package:laban/ui/home.dart';
import 'package:laban/ui/landing.dart';
import 'package:laban/ui/login.dart';
import 'package:laban/ui/signup.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:provider/provider.dart';

void main() {
  // if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
  //   sqfliteFfiInit();
  //   databaseFactory = databaseFactoryFfi;
  // }
  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [ChangeNotifierProvider(create: (_) => CountNotifier())],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laban',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Login(),
      // Home(),
      // Login()
      // SignUp(),
      routes: {
        '/landing': (context) => const Landing(),
      },
    );
  }
}
