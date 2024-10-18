import 'package:flutter/material.dart';
import 'package:goldsecurity/Models/salas_model.dart';
import 'package:goldsecurity/Provider/Salas/salas.dart';
import 'package:goldsecurity/Style/colors.dart';
import 'package:goldsecurity/Utils/msg.dart';
import 'package:goldsecurity/Widget/botao.dart';
import 'package:goldsecurity/Widget/textfild.dart';
import 'package:provider/provider.dart';

class CadastrarSalas extends StatefulWidget {
  final Sala? ambiente;
  const CadastrarSalas({super.key, this.ambiente});

  @override
  State<CadastrarSalas> createState() => _CadastrarSalasState();
}

class _CadastrarSalasState extends State<CadastrarSalas> {
  final _nomeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.ambiente != null){
      _nomeController.text = widget.ambiente!.nomeSala;
    }
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          actions: [Image(image: AssetImage('assets/images/logoTcc2.png'),)],
          title: Text("Cadastrar Salas", style: TextStyle(color: branco)),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, Colors.white])),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
              child:  Consumer<AmbienteProvider>(
              builder: (context, salaProvider, child) {
                return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                customTextField(
                  title: 'Nome',
                  hint: 'Digite seu nome',
                  tcontroller: _nomeController,
                  ),
          
              const SizedBox(height: 15),
                  
              const SizedBox(height: 10),
          
              customButton(
                text: 'Cadastrar', 
                tap: () async {
                final ambiente = Sala(salaId: widget.ambiente?.salaId, nomeSala: _nomeController.text, acionado: false);
                 if (widget.ambiente == null) {
                          await salaProvider.cadastrarAmbiente(ambiente);
                        } else {
                          await salaProvider.atualizarAmbiente(ambiente);
                        }
                    
              
                showMessage( message: salaProvider.menssagem, context: context);
                Navigator.pop(context);
              }
              ),
             ]
            );}),
          )
        ),
    );
  }
}