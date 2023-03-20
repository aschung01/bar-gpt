import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:wrapped_korean_text/wrapped_korean_text.dart';

class FontFamily {
  static const String notoSans = "NotoSanskr";
}

class FontWeightManager {
  static const FontWeight thin = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w800;
  static const FontWeight biggerBlack = FontWeight.w900;
}

enum Typo {
  h1,
  h2,
  h3,
  h3Thin,
  h4,
  h4Line,
  h5,
  h5big,
  label,
  label1,
  label2,
  p,
  p0,
  p0_1,
  p1,
  p2
}

class FontManager {
  static WrappedKoreanText kText(Typo typo, String text,
      {Color color = ColorManager.gray9,
      int? maxLines,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow}) {
    return WrappedKoreanText(
      text,
      style: textStyle(typo, color: color),
      maxLines: maxLines ?? 100,
      textAlign: textAlign,
    );
  }

  static Text text(Typo typo, String text,
      {Color color = ColorManager.gray9,
      int? maxLines,
      TextAlign textAlign = TextAlign.start,
      TextOverflow? overflow}) {
    return Text(
      text,
      style: textStyle(typo, color: color),
      maxLines: maxLines ?? 100,
      textAlign: textAlign,
    );
  }

  static TextStyle textStyle(
    Typo typo, {
    Color color = ColorManager.gray9,
  }) {
    switch (typo) {
      case Typo.h1:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 32.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.h2:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.h3:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.h3Thin:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 20.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.5,
        );
      case Typo.h4:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.h4Line:
        return TextStyle(
            fontFamily: FontFamily.notoSans,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: color,
            height: 1.5,
            decoration: TextDecoration.lineThrough);
      case Typo.h5:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.h5big:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.5,
        );
      case Typo.label:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 13.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.0,
        );
      case Typo.label1:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.0,
        );
      case Typo.label2:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.0,
        );
      case Typo.p:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
      case Typo.p0:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
      case Typo.p0_1:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
      case Typo.p1:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
      case Typo.p2:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
      default:
        return TextStyle(
          fontFamily: FontFamily.notoSans,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: color,
          height: 1.8,
        );
    }
  }
}
