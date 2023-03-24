import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: Homepage(),
    );
  }
}
