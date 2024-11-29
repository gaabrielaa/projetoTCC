import 'package:flutter/material.dart';
import 'package:goldsecurity/Style/colors.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? tcontroller,
  String? Function(String?)? validator, 
  bool? obscureTexto = false,// Adicionado o parâmetro validator
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null)
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: branco,
            ),
          ),
        ),
      TextFormField(
        controller: tcontroller,
        style: TextStyle(color: branco),
        obscureText: obscureTexto as bool,
        validator: validator, // Adicionada a validação aqui
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38),
          filled: true,
          fillColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: primaryColor, // Cor da borda
              width: 2.0, // Espessura da borda
            ),
          ),
        ),
      ),
    ],
  );
}
