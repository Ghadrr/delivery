import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/home_page.dart';
import 'package:helloworld/views/login_page.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LoginPage(),
    ),
  );
}
