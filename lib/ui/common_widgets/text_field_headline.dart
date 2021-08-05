import 'package:flutter/material.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class TextFieldHeadline extends StatelessWidget {

  final String headline;

  const TextFieldHeadline({required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: TextStyle(color: grey, fontSize: dp15),
    );
  }
}
