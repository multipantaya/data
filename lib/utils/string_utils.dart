import 'package:flutter/material.dart';

class StringUtils {
  const StringUtils._();

  static String notNullError(dynamic error) {
    return error ?? "unknown_error";
  }

  static TextAlign convertToTextAlign(String text) {
    TextAlign textAlign = TextAlign.center;
    if (text.contains('left')) {
      textAlign = TextAlign.left;
    } else if (text.contains('right')) {
      textAlign = TextAlign.right;
    } else if (text.contains('end')) {
      textAlign = TextAlign.end;
    } else if (text.contains('justify')) {
      textAlign = TextAlign.justify;
    } else if (text.contains('start')) {
      textAlign = TextAlign.start;
    }
    return textAlign;
  }
}
