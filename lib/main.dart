import 'package:explore/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Pasta',
      theme: ThemeData(
        highlightColor: Color.fromRGBO(240, 178, 23, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
