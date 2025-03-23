import 'package:flutter/material.dart';

BoxDecoration gradientRect({required Color first, required Color second}) =>
    BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [first, second],
      ),
    );
