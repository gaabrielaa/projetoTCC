import 'package:flutter/material.dart';
import 'package:goldsecurity/Provider/Funcionario/funcionariop.dart';
import 'package:goldsecurity/Provider/Salas/salas.dart';
import 'package:goldsecurity/Style/colors.dart';
import 'package:goldsecurity/Utils/msg.dart';
import 'package:provider/provider.dart';

class AssociarFuncionarioSala extends StatefulWidget {
  final int salaId; // Recebe o ID da sala para associar o funcionário

  const AssociarFuncionarioSala({required this.salaId, Key? key})
      : super(key: key);

  @override
  State<AssociarFuncionarioSala> createState() =>
      _AssociarFuncionarioSalaState();
}

class _AssociarFuncionarioSalaState extends State<AssociarFuncionarioSala> {
  int? _funcionarioSelecionado;

  @override
  void initState() {
    super.initState();
    Provider.of<FuncionarioProvider>(context, listen: false)
        .fetchFuncionario(); // Carrega a lista de funcionários
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Associar Funcionário à Sala", style: TextStyle(color: branco)),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<FuncionarioProvider>(
          builder: (context, funcProvider, child) {
            if (funcProvider.funcionarios.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const Text(
                  "Selecione um Funcionário",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                DropdownButton<int>(
                  isExpanded: true,
                  value: _funcionarioSelecionado,
                  hint: const Text("Selecione um Funcionário"),
                  items: funcProvider.funcionarios.map((funcionario) {
                    return DropdownMenuItem<int>(
                      value: funcionario.funcionarioId,
                      child: Text(funcionario.nome),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _funcionarioSelecionado = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _funcionarioSelecionado != null
                      ? () async {
                          final sucesso = await Provider.of<AmbienteProvider>(
                                  context,
                                  listen: false)
                              .associarFuncionarioSala(
                                  funcionarioId: _funcionarioSelecionado!,
                                  salaId: widget.salaId);

                          if (sucesso) {
                            showMessage(
                                message: "Funcionário associado com sucesso!",
                                // ignore: use_build_context_synchronously
                                context: context);
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          } else {
                            showMessage(
                                message: "Falha ao associar funcionário.",
                                // ignore: use_build_context_synchronously
                                context: context);
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: const Text("Associar"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}