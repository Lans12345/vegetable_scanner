import 'package:flutter/material.dart';

import 'package:vegetable_scanner/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  final String text;

  const ButtonWidget({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minWidth: 250,
      color: Color(0xff53BA2E),
      onPressed: onPressed,
      child: TextBold(text: text, fontSize: 18, color: Colors.white),
    );
  }
}
