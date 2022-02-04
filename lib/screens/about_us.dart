import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return       Container(child: Center(child: Text('About us Screen',style: TextStyle(fontSize: 30),)),);

  }
}
