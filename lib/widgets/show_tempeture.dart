import 'package:flutter/material.dart';

class ShowTempeture extends StatelessWidget {
  final Color color;
  final double fontsize;
  final String text;
  final FontWeight? fontWeight;

  const ShowTempeture(
      {Key? key,
      required this.color,
      required this.fontsize,
      required this.text,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight),
    );
  }
}
