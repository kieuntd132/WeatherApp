import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xff081b25),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
