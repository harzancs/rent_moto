import 'package:flutter/material.dart';
import 'package:rent_moto/constants/constants.dart';

class Label extends StatelessWidget {
  const Label(this.text,
      {this.fontSize = FONT_BASE,
      this.fontWeight = FONT_WEIGHT_NORMAL,
      this.fontStyle,
      this.decoration,
      this.decorationColor,
      this.color,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.height,
      this.shadows,
      this.key});

  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final double? height;
  final List<Shadow>? shadows;
  final UniqueKey? key;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? COLOR_BLACK,
        fontSize: fontSize,
        height: height,
        fontWeight: fontWeight,
        fontFamily: FONT_FAMILY,
        fontStyle: fontStyle,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: decorationColor ?? Theme.of(context).primaryColor,
        shadows: shadows,
      ),
      key: key,
    );
  }
}
