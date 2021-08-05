import 'package:flutter/material.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class UpdateButton extends StatelessWidget {
  final String text;
  final Function() onClicked;

  const UpdateButton({required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(dp10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            dp10,
          ),
        ),
        side: BorderSide(color: accent),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
          color: accent,
          fontSize: dp20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
