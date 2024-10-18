import 'package:flutter/material.dart';
import 'package:goldsecurity/Style/colors.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? tcontroller,
}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          
        child: Text(title!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
            color: branco,
          )
        ),
      ),
      TextFormField(
          controller: tcontroller,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: primaryColor, // Cor da borda
                width: 2.0, // Espessura da borda
              ),
          
          ), )
      )
    ],
  );
}
