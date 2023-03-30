import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:rent_moto/constants/constants.dart';
import 'package:rent_moto/other/util/is.dart';
import 'package:rent_moto/other/widget/app_bar/white_bg_app_bar.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _idCardController = TextEditingController();
  TextEditingController _idPassportController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _driverLicenseController = TextEditingController();
  TextEditingController _birthDayController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  TextEditingController _subDistrictController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _zipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WhiteBgAppBar(
      title: "ลงทะเบียนใช้บริการ",
      titlePreviousShow: false,
      previousShow: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 50,
                        color: COLOR_BLUE,
                        alignment: Alignment.center,
                        child: const Label(
                          "ข้อมูลส่วนตัว",
                          fontSize: FONT_HECTO,
                          color: COLOR_WHITE,
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
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
                              controller: _idCardController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                icon: Icon(Icons.credit_card_sharp),
                                labelText: 'เลขบัตรประจำตัวประชาชน',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _idPassportController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                icon: Icon(Icons.card_travel),
                                labelText: 'เลขหนังสือเดินทาง',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _driverLicenseController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                icon: Icon(Icons.car_crash),
                                labelText: 'เลขที่ใบอนุญาตขับขี่',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (!Is.notNullOrBlank(
                                  _birthDayController.text)) {
                                _birthDayController.text =
                                    await _selectDate(DateTime.now());
                                return null;
                              }
                              _birthDayController.text = await _selectDate(
                                  DateTime.parse(_birthDayController.text));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: COLOR_GREY,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                enabled: false,
                                controller: _birthDayController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                  fontSize: FONT_DECA,
                                  fontFamily: FONT_FAMILY,
                                ),
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                      fontFamily: FONT_FAMILY,
                                      fontSize: FONT_BASE),
                                  icon: Icon(Icons.cake),
                                  labelText: 'วันเดือนปี เกิด',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                icon: Icon(Icons.phone),
                                labelText: 'เบอร์โทรศัพท์',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _occupationController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                icon: Icon(Icons.work),
                                labelText: 'อาชีพ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 50,
                        color: COLOR_BLUE,
                        alignment: Alignment.center,
                        child: const Label(
                          "ที่อยู่ที่สามารถติดต่อได้",
                          color: COLOR_WHITE,
                          fontSize: FONT_HECTO,
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
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
                              controller: _addressController,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              maxLines: 3,
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                labelText: 'ที่อยู่',
                                hintText: "บ้านเลขที่ ,หมู่ ,ซอย ,ถนน",
                                hintStyle: TextStyle(
                                    color: COLOR_GREY_LIGHT,
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _subDistrictController,
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                labelText: 'แขวง/ตำบล',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _districtController,
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                labelText: 'เขต/อำเภอ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _provinceController,
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                labelText: 'จังหวัด',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
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
                              controller: _zipController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              style: const TextStyle(
                                fontSize: FONT_DECA,
                                fontFamily: FONT_FAMILY,
                              ),
                              decoration: const InputDecoration(
                                labelStyle: TextStyle(
                                    fontFamily: FONT_FAMILY,
                                    fontSize: FONT_BASE),
                                labelText: 'รหัสไปรษณีย์',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: BoxDecoration(
                        color: COLOR_BLUE,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: COLOR_GREY_LIGHT,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Label(
                        "ตกลง",
                        color: COLOR_WHITE,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(DateTime dateTime) async {
    var now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(now.year - 100),
        lastDate: DateTime.now());
    return DateFormat("yyyy-MM-dd").format(pickedDate!);
  }
}
