// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questiontext;
  Question(this.questiontext, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: EdgeInsets.all(10 * MediaQuery.of(context).size.width / 411),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(45)),
      child: Text(
        questiontext,
        style: TextStyle(
            fontSize: 20 * MediaQuery.of(context).size.width / 411,
            fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
