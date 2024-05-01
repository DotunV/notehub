// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notehub/pages/home_page.dart';

void main() {
  runApp(NoteHubApp());
}

class NoteHubApp extends StatelessWidget {
  const NoteHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notehub',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
