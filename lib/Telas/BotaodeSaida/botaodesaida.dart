import 'package:flutter/material.dart';
import 'package:goldsecurity/Style/colors.dart';
import 'package:goldsecurity/Widget/botao.dart';

class Botaodesaida extends StatelessWidget {
  const Botaodesaida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [Image(image: AssetImage('assets/images/logoTcc2.png'),)],
          title: Text("GoldSecurity", style: TextStyle(color: branco)),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryColor, Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Botão de Liberação',
                  style: TextStyle(color: branco, fontSize: 23),
                ),

            const SizedBox(height: 15),

            customButton(
              text: 'Liberar', 
              tap: null
            ),
           ]
          ),
        )
      )
    );
  }
}
