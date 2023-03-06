import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  Color color;
  FontWeight? fontWeight;
  double size;
  int? maxLines;
  ReusableText(
      {Key? key,
      required this.text,
      this.fontWeight,
      this.size = 15,
      this.color = Colors.black,
      this.maxLines
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,maxLines: maxLines,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: size,

      ),
    );
  }
}
