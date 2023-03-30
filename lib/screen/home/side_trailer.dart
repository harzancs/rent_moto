import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/screen/home/car_card.dart';

class SideTrailler extends StatefulWidget {
  const SideTrailler({Key? key}) : super(key: key);

  @override
  State<SideTrailler> createState() => _SideTraillerState();
}

class _SideTraillerState extends State<SideTrailler> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var collection = FirebaseFirestore.instance.collection('motor');
    var querySnapshot = await collection.get();
    print("==> ");
    print(querySnapshot.docs);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: 10,
      itemBuilder: (BuildContext ctx, index) {
        return CarCard();
      },
    );
  }
}
