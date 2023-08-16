import 'package:flutter/material.dart';

class ResultRow extends StatelessWidget {
  final String label;
  final String value;
  const ResultRow(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("$label:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Theme.of(context).primaryColor)),
          ],
        ),
        Row(
          children: [Text(value, style: TextStyle(fontSize: 16, color: Theme.of(context).shadowColor))],
        )
      ],
    );
  }
}
