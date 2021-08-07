import 'package:flutter/material.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class TextFieldValueWidget extends StatelessWidget {
  final String headline;

  const TextFieldValueWidget({required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
