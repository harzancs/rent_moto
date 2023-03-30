import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/constants/fonts.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

class BookingResultScreen extends StatefulWidget {
  const BookingResultScreen({Key? key, this.id, this.title}) : super(key: key);
  final String? id;
  final String? title;

  @override
  State<BookingResultScreen> createState() => _BookingResultScreenState();
}

class _BookingResultScreenState extends State<BookingResultScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
      title: widget.title,
      titlePreviousShow: false,
      previousShow: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Card(
              color: COLOR_WHITE,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: COLOR_SUCCESS, shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.done_outline_sharp,
                          color: COLOR_WHITE,
                          size: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Label(
                      "เช่าสำเร็จ",
                      fontSize: FONT_MEGA,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Label(
                      "วันที่จอง 2013/03/30 12:00:00",
                      fontSize: FONT_HECTO,
                      fontWeight: FONT_WEIGHT_NORMAL,
                    ),
                    Label(
                      "วันที่เริ่ม 2013/03/30",
                      fontSize: FONT_HECTO,
                      fontWeight: FONT_WEIGHT_NORMAL,
                    ),
                    Label(
                      "วันที่สิ้นสุด 2013/03/30",
                      fontSize: FONT_HECTO,
                      fontWeight: FONT_WEIGHT_NORMAL,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BookingListScreen(
                                    isNotSusscess: false)));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 10),
                        decoration: BoxDecoration(
                            color: COLOR_BLUE,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Label(
                          "รายการเช่า",
                          color: COLOR_WHITE,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Label(
                        "หน้าแรก",
                        color: COLOR_BLACK,
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

  _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    return DateFormat("yyyy-MM-dd").format(pickedDate!);
  }
}
