import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/constants/fonts.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({Key? key, this.isNotSusscess = true})
      : super(key: key);
  final bool isNotSusscess;

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
        title: "รายการจอง",
        titlePreviousShow: !widget.isNotSusscess,
        titlePrevious: widget.isNotSusscess ? "" : "หน้าแรก",
        onPressBack: () {
          if (!widget.isNotSusscess) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else {
            Navigator.pop(context);
          }
        },
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: COLOR_WHITE,
                child: Container(
                  child: Row(children: [
                    Container(
                      width: 130,
                      height: 130,
                      child: Image.network(
                        "https://f.ptcdn.info/455/049/000/oluyj71wpib3tl5HSkc-o.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Label(
                                  "HONDA Click 125 สีดำ",
                                  fontSize: FONT_DECA,
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                child: Label(
                                  "1 กก 1234 ตรัง",
                                  fontSize: FONT_DECA,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(
                                "วันที่เริ่ม",
                              ),
                              Label(
                                "วันที่สิ้นสุด",
                              ),
                              Label(
                                "สถานะ : กำลังใช้งาน",
                                color: COLOR_SUCCESS,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              );
            }));
  }
}
