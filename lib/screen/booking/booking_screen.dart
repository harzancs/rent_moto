import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:rent_moto/constants/colors.constant.dart';
import 'package:rent_moto/constants/fonts.constant.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key, this.id, this.title}) : super(key: key);
  final String? id;
  final String? title;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  TextEditingController _startDate = TextEditingController();
  TextEditingController _endDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
      title: widget.title,
      titlePreviousShow: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                    "https://f.ptcdn.info/455/049/000/oluyj71wpib3tl5HSkc-o.jpg"),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: COLOR_WHITE,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Label(
                          "HONDA Click 125 สีดำ",
                          fontSize: FONT_MEGA,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        child: Label(
                          "1 กก 1234 ตรัง",
                          fontSize: FONT_KILO,
                          maxLines: 1,
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Label(
                              "สี แดง",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            child: Label(
                              "ปีผลิต : 2019",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Label(
                              "ประเภท : 2 ล้อ",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            child: Label(
                              "ประเภทเกียร์ : ธรรมดา",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Label(
                              "ประเภทน้ำมัน : แก๊สโซฮอร์ 95",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Label(
                              "ราคาเช่า : 280 บาท/วัน",
                              fontSize: FONT_DECA,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: COLOR_WHITE,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _startDate.text = await _selectDate();
                          _endDate.text = _startDate.text;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: COLOR_GREY,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            enabled: false,
                            controller: _startDate,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.timelapse),
                              labelText: 'วันที่ เริ่ม',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          _endDate.text = await _selectDate();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: COLOR_GREY,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: _endDate,
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.timelapse),
                              labelText: 'วันที่ สิ้นสุด',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BookingResultScreen()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: COLOR_BLUE,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Label(
                                "ตกลง",
                                color: COLOR_WHITE,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
