import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/constants/fonts.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/home/car_card.dart';
import 'package:rent_moto/screen/home/side_trailer.dart';
import 'package:rent_moto/screen/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: COLOR_WHITE,
          title: const Label(
            "rent moto",
            fontSize: FONT_HECTO,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: COLOR_BLACK,
            ),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              SizedBox(
                height: 50,
                child: Center(
                  child: Label(
                    "รถจักรยานยนตร์",
                    fontSize: FONT_DECA,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: Label(
                    "รถพ่วงข้าง",
                    fontSize: FONT_DECA,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _motorbike(),
            SideTrailler(),
          ],
        ),
        drawer: menu(),
      ),
    );
  }

  Widget _motorbike() {
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

  Widget menu() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            child: const Center(child: const Text('Drawer Header')),
            color: COLOR_BLUE,
            width: double.infinity,
          ),
          Expanded(
              child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.book_outlined),
                title: const Label('รายการจอง'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookingListScreen(
                                isNotSusscess: true,
                              )));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Label('ออกจากระบบ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
