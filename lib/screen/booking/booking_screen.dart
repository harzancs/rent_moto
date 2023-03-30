import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key, this.id, this.title}) : super(key: key);
  final String? id;
  final String? title;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
      title: widget.title,
      titlePreviousShow: false,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Image.network(
                  "https://f.ptcdn.info/455/049/000/oluyj71wpib3tl5HSkc-o.jpg"),
            ),
            Card(
              color: COLOR_WHITE,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: COLOR_GREY,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.timelapse),
                          labelText: 'วันที่เวลา เริ่ม',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: COLOR_GREY,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.timelapse),
                          labelText: 'วันที่เวลา สิ้นสุด',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
