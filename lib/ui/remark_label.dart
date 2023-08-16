import 'package:flutter/material.dart';

class ChartRemark extends StatelessWidget {
  final Color color;
  final String text;
  const ChartRemark(
    this.color,
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 2,
            width: 12,
            color: Colors.blueGrey,
          ),
          Text(text),
        ],
      ),
    );
  }
}
