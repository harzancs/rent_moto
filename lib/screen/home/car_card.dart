import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rent_moto/constants/constants.dart';
import 'package:rent_moto/other/widget/label.dart';
import 'package:rent_moto/screen/screen.dart';

class CarCard extends StatelessWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BookingScreen(
                    title: "HONDA Click 125 สีดำ", id: "")));
      },
      child: Card(
        color: COLOR_WHITE,
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/rent-df092.appspot.com/o/b%2Fb_1.jpg?alt=media&token=b46a9d39-d2c8-4175-bdca-a00313381f35"),
            )),
            Container(
              height: 50,
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              alignment: Alignment.center,
              child: const Label(
                "HONDA Click 125 สีดำ",
                color: COLOR_BLACK,
                fontSize: FONT_BASE,
                maxLines: 2,
                height: 1.2,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              color: COLOR_BLUE,
              alignment: Alignment.center,
              child: const Label(
                "เช่า",
                color: COLOR_WHITE,
                fontSize: FONT_DECA,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
