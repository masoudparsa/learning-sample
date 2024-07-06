import 'package:flutter/material.dart';

class NumberCard2Widget extends StatefulWidget {
  final FocusNode focusNode;
  final Function(String value) onCompleted;
  const NumberCard2Widget(
      {super.key, required this.focusNode, required this.onCompleted});

  @override
  State<NumberCard2Widget> createState() => _NumberCard2WidgetState();
}

class _NumberCard2WidgetState extends State<NumberCard2Widget> {
  TextEditingController numberCardTextEditingController =
      TextEditingController();

  String formatInput(String text) {
    text = text.replaceAll('-', "");

    final buffer = StringBuffer();
    for (int i = 0; i < text.length && i < 16; i++) {
      if (i % 4 == 0 && i > 0) buffer.write('-');
      buffer.write(text[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("شماره کارت", style: TextStyle(fontFamily: "IRANSans")),
        const SizedBox(
          height: 16,
        ),
        Row(children: [
          Expanded(
              child: TextFormField(
            textAlign: TextAlign.center,
            maxLength: 19,
            keyboardType: TextInputType.number,
            controller: numberCardTextEditingController,
            focusNode: widget.focusNode,
            decoration: const InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            ),
            onChanged: (value) {
              numberCardTextEditingController.text = formatInput(value);

              if (numberCardTextEditingController.text.length == 19) {
                widget.onCompleted(value);
              }
            },
          ))
        ])
      ],
    );
  }
}
