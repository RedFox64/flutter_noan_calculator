import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calculator/utils/field.dart';

class NumberField extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final FieldDataStream<num?> streamData;

  const NumberField({
    Key? key,
    required this.label,
    required this.streamData,
    this.padding = const EdgeInsets.only(top: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          StreamBuilder<num?>(
              stream: streamData.stream,
              builder: (BuildContext context, AsyncSnapshot<num?> snapshot) {
                return TextField(
                  controller: streamData.controller,
                  keyboardType: const TextInputType.numberWithOptions(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(errorText: snapshot.error?.toString(), errorMaxLines: 2),
                  onChanged: (String str) {
                    try {
                      streamData.change(str.isNotEmpty ? num.parse(str) : null);
                    } catch (e) {
                      streamData.addError("Введите число");
                    }
                  },
                );
              })
        ],
      ),
    );
  }
}
