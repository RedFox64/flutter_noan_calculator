import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calculator/utils/field.dart';

class NumberField extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final FieldDataStream<double?> streamData;
  final TextEditingController _controller = TextEditingController();
  final List<TextInputFormatter>? formatters;

  NumberField(
      {Key? key,
      required this.label,
      required this.streamData,
      this.padding = const EdgeInsets.only(top: 10),
      this.formatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(label),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: StreamBuilder<double?>(
                      stream: streamData.stream,
                      builder: (BuildContext context, AsyncSnapshot<double?> snapshot) {
                        _controller.text = snapshot.data != null ? snapshot.data.toString() : "";

                        return TextField(
                          controller: _controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                          textInputAction: TextInputAction.next,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^([1-9]\d*)')),
                            FilteringTextInputFormatter.singleLineFormatter,
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(errorText: snapshot.error?.toString()),
                          onChanged: (String str) {
                            try {
                              streamData.change(str.isNotEmpty ? double.parse(str) : null);
                            } catch (e) {
                              streamData.addError("invalid field");
                            }
                          },
                        );
                      }))
            ],
          ),
        ],
      ),
    );
  }
}

class NumberFieldWithState extends StatefulWidget {
  final String label;
  final EdgeInsets padding;
  final FieldDataStream<num?> streamData;

  const NumberFieldWithState({
    Key? key,
    required this.label,
    required this.streamData,
    this.padding = const EdgeInsets.only(top: 10),
  }) : super(key: key);

  @override
  State<NumberFieldWithState> createState() => _NumberFieldWithStateState();
}

class _NumberFieldWithStateState extends State<NumberFieldWithState> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          StreamBuilder<num?>(
              stream: widget.streamData.stream,
              builder: (BuildContext context, AsyncSnapshot<num?> snapshot) {
                return TextField(
                  controller: _controller,
                  keyboardType: const TextInputType.numberWithOptions(),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(errorText: snapshot.error?.toString(), errorMaxLines: 2),
                  onChanged: (String str) {
                    try {
                      widget.streamData.change(str.isNotEmpty ? num.parse(str) : null);
                    } catch (e) {
                      widget.streamData.addError("Введите число");
                    }
                  },
                );
              })
        ],
      ),
    );
  }
}
