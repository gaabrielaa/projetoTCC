import 'package:flutter/material.dart';
import 'package:goldsecurity/Provider/FuncionarioSala/funcsalap.dart';
import 'package:goldsecurity/Style/colors.dart';
import 'package:goldsecurity/Utils/msg.dart';
import 'package:goldsecurity/Widget/botao.dart';
import 'package:provider/provider.dart';

class Botaodesaida extends StatefulWidget {
  final int? funcionario;
  const Botaodesaida({super.key, this.funcionario});

  @override
  State<Botaodesaida> createState() => _BotaodesaidaState();
}

class _BotaodesaidaState extends State<Botaodesaida> {
  @override
  void initState() {
    Provider.of<FuncSalaProvider>(context, listen: false)
        .fetchSalasFuncionario(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Image(
            image: AssetImage('assets/images/logoTcc2.png'),
          )
        ],
        title: Text("GoldAccess", style: TextStyle(color: branco)),
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
          child:
              Consumer<FuncSalaProvider>(builder: (context, provider, child) {
            return ListView.builder(
                itemCount: provider.salasfuncionario.length,
                itemBuilder: (context, index) {
                  final sala = provider.salasfuncionario[index];
                  return Column(children: [
                    Container(
                      height: 70, 
                      decoration: BoxDecoration(
                        color: primaryColor,
                        // border: Border.all(
                        //   color: Colors.black, // Cor da borda
                        //   width: 1.0,
                        // ),
                        borderRadius: BorderRadius.circular(
                            8), // Cantos arredondados (opcional)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              sala.nomeSala,
                              style: TextStyle(fontSize: 19, color: branco),
                            ),
                            Text(sala.acionado ? " Aberta" : " Fechada",
                            style: const TextStyle(color: Colors.white70, fontSize: 13)),
                            const Spacer(), // Adiciona espaço flexível para empurrar o botão
                            customButton(
                              text: 'Liberar',
                              tap: () async {
                                await provider.acionarSala(sala.salaId as int);
                                if (provider.acionarsala) {
                                  showMessage(
                                      message: provider.menssagem,
                                      context: context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ]);
                });
          }),
        ),
      ),
    );
  }
}
