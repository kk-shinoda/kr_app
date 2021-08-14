import 'package:flutter/material.dart';

BoxDecoration kBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.green.withOpacity(0.15),
        Colors.orange.withOpacity(0.1),
        Colors.orange.withOpacity(0.15)
      ]),
);

ButtonStyle kButtonStyleForm =
    ElevatedButton.styleFrom(primary: Colors.brown.shade400);
