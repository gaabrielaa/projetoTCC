import 'package:flutter/material.dart';
import 'package:goldsecurity/Models/funcionari_models.dart';
import 'package:goldsecurity/Provider/Funcionario/funcionariop.dart';
import 'package:goldsecurity/Style/colors.dart';
import 'package:goldsecurity/Utils/msg.dart';
import 'package:goldsecurity/Widget/botao.dart';
import 'package:goldsecurity/Widget/textfild.dart';
import 'package:provider/provider.dart';

class CadastrarFunc extends StatefulWidget {
  final Funcionarios? funcionario;

  const CadastrarFunc({Key? key, this.funcionario}) : super(key: key);

  @override
  State<CadastrarFunc> createState() => _CadastrarFuncState();
}

class _CadastrarFuncState extends State<CadastrarFunc> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _rfidController = TextEditingController();
  final _passwordController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cargoController = TextEditingController();
  final _turnoController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Se houver um funcionário, preencha os campos com os dados dele
    if (widget.funcionario != null) {
      _nomeController.text = widget.funcionario!.nome;
      _emailController.text = widget.funcionario!.email;
      _cpfController.text = widget.funcionario!.cpf;
      _rfidController.text = widget.funcionario!.rfid;
      _passwordController.text = widget.funcionario!.password;
      _telefoneController.text = widget.funcionario!.telefone;
      _cargoController.text = widget.funcionario!.cargo;
      _turnoController.text = widget.funcionario!.turno;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Image(image: AssetImage('assets/images/logoTcc2.png')),
        ],
        title: Text(
          widget.funcionario == null ? "Cadastrar Funcionário" : "Editar Funcionário",
          style: TextStyle(color: branco),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [primaryColor, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<FuncionarioProvider>(
              builder: (context, funcProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextField(
                      tcontroller: _nomeController,
                      title: 'Nome',
                      hint: 'Digite seu nome',
                    ),
                    customTextField(
                      tcontroller: _emailController,
                      title: 'Email',
                      hint: 'Digite seu e-mail',
                    ),
                    customTextField(
                      tcontroller: _passwordController,
                      title: 'Senha',
                      hint: 'Digite sua senha',
                    ),
                    customTextField(
                      tcontroller: _rfidController,
                      title: 'RFID',
                      hint: 'Digite seu RFID',
                    ),
                    customTextField(
                      tcontroller: _cpfController,
                      title: 'CPF',
                      hint: 'Digite seu CPF',
                    ),
                    customTextField(
                      tcontroller: _telefoneController,
                      title: 'Número de Telefone',
                      hint: 'Digite seu numero de telefone',
                    ),
                    customTextField(
                      tcontroller: _cargoController,
                      title: 'Cargo',
                      hint: 'Digite seu cargo',
                    ),
                    customTextField(
                      tcontroller: _turnoController,
                      title: 'Turno',
                      hint: 'Digite seu turno',
                    ),
                    const SizedBox(height: 15),
                    const SizedBox(height: 10),
                    customButton(
                      text: widget.funcionario == null ? 'Cadastrar' : 'Salvar Alterações',
                      tap: () async {
                        final funcionario = Funcionarios(
                          funcionarioId: widget.funcionario?.funcionarioId,
                          nome: _nomeController.text,
                          email: _emailController.text,
                          cpf: _cpfController.text,
                          rfid: _rfidController.text,
                          password: _passwordController.text,
                          telefone: _telefoneController.text,
                          cargo: _cargoController.text,
                          turno: _turnoController.text,
                        );

                        if (widget.funcionario == null) {
                          await funcProvider.cadastrarFunc(funcionario);
                        } else {
                          await funcProvider.atualizarFunc(funcionario);
                        }

                        showMessage(message: funcProvider.menssagem, context: context);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
