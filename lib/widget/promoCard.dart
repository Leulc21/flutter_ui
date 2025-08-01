// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget promoCard(image) {
  return AspectRatio(
    aspectRatio: 2.8 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.purple[200],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.1, 0.9],
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.1),
            ],
          ),
        ),
      ),
    ),
  );
}
