import 'package:flutter/material.dart';
import 'package:goldsecurity/Style/colors.dart';

Widget customButton({
  VoidCallback? tap,
  bool? status = false,
  String? text,
}) {
  return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 250,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: primaryColor, 
                padding: const EdgeInsets.all(16.0)
            ),
            onPressed: tap,
            child: Text(
              status == false ? text! : 'Aguarde...',
              style: TextStyle(fontSize: 18.0, color: branco, ),
            ),
          ),
        ),
      )
    );
}