import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../Colors.dart';

ToastFuture showStyledToast(
  BuildContext context, {
  required String message,
  Duration time = const Duration(seconds: 2),
}) =>
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.bottom,
      animDuration: const Duration(seconds: 1),
      duration: time,
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: Color5,
      textStyle: TextStyle(
          color: kPrimaryColor,
          fontFamily: 'ElMessiri'
      ),

    );
