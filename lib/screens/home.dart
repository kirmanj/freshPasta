import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return       Container(
      color: Colors.red,
      child: Center(child:
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('test').orderBy('Time', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('sss ${snapshot.error}');
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Container(
            height: 1000,
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()!;
                return ListTile(
                  title: Text(data['test1'].toString()),
                );
              }).toList(),
            ),
          );
        },
      ),

      ),
    );

  }
}
