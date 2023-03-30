import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/constants/fonts.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: COLOR_WHITE,
          title: Label("rent moto"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: <Widget>[
              Container(
                height: 30,
                child: Label(
                  "รถจักรยานยนตร์",
                  fontSize: FONT_DECA,
                ),
              ),
              Container(
                height: 30,
                child: Label(
                  "รถพ่วงข้าง",
                  fontSize: FONT_DECA,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _motorbike(),
            _sidetrailer(),
          ],
        ),
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
        return Card(
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/rent-df092.appspot.com/o/b%2Fb_1.jpg?alt=media&token=b46a9d39-d2c8-4175-bdca-a00313381f35"),
              )),
              Container(
                height: 50,
                padding: EdgeInsets.all(5),
                width: double.infinity,
                alignment: Alignment.center,
                child: Label(
                  "HONDA Click 125 สีดำ",
                  color: COLOR_BLACK,
                  fontSize: FONT_BASE,
                  maxLines: 2,
                  height: 1.2,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                color: COLOR_BLUE,
                alignment: Alignment.center,
                child: Label(
                  "จอง",
                  color: COLOR_WHITE,
                  fontSize: FONT_DECA,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sidetrailer() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      itemCount: 10,
      itemBuilder: (BuildContext ctx, index) {
        return Card(
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                child: Image.network(
                    "https://f.ptcdn.info/455/049/000/oluyj71wpib3tl5HSkc-o.jpg"),
              )),
              Container(
                height: 50,
                padding: EdgeInsets.all(5),
                width: double.infinity,
                alignment: Alignment.center,
                child: Label(
                  "HONDA Click 125 สีดำ",
                  color: COLOR_BLACK,
                  fontSize: FONT_BASE,
                  maxLines: 2,
                  height: 1.2,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                color: COLOR_BLUE,
                alignment: Alignment.center,
                child: Label(
                  "จอง",
                  color: COLOR_WHITE,
                  fontSize: FONT_DECA,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
