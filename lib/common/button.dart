import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wapp/utils/utils.dart';

class Button extends StatelessWidget {
  final String buttontext;
  final Decoration buttonDecoration;

  // ignore: prefer_typing_uninitialized_variables
  var onPressed;

  // ignore: use_key_in_widget_constructors
  Button(
      {required this.buttontext,
      required this.buttonDecoration,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10,
          bottom: 10
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue
        ),
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          decoration: buttonDecoration,
          child: Center(
            child: Text(
              buttontext,
              style: jTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
