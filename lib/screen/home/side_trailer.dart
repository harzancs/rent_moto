import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/home/car_card.dart';

class SideTrailler extends StatefulWidget {
  const SideTrailler({Key? key}) : super(key: key);

  @override
  State<SideTrailler> createState() => _SideTraillerState();
}

class _SideTraillerState extends State<SideTrailler> {
  Stream<QuerySnapshot>? collection;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    print(firestore.settings);
    setState(() {
      collection = FirebaseFirestore.instance.collection('motor').snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: collection,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong  [1]');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data["brand"]),
                );
              }).toList(),
            );
          } else {
            return Text('Something went wrong  [2]');
          }
        });
  }
}
