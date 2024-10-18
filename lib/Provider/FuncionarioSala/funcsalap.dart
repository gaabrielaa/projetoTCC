
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goldsecurity/Constrain/appUrl.dart';
import 'package:goldsecurity/Models/funcionari_models.dart';
import 'package:goldsecurity/Models/funcsalamodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FuncSalaProvider with ChangeNotifier{


  bool _cadastrado = false;
  bool get cadastrado => _cadastrado;

  bool _carregando = false;
  bool get carregando => _carregando;

  String _menssagem = "";
  String get menssagem => _menssagem;

  List<FuncionarioSala> _ambientes = [];

  List<FuncionarioSala> get ambientes => _ambientes;

  List<Funcionarios> _funcionarios = [];

  List<Funcionarios> get funcionarios => _funcionarios;
  
  String? token;

Future<void> pegarToken() async {
    _carregando = true;
    var dados = await SharedPreferences.getInstance();
    token = dados.getString("token");
}


Future<void> fetchSalas(int idSala) async {
      final url = '${AppUrl.baseUrl}api/Sala/Funcionario/$idSala';
    try {
      await pegarToken();
      final response = await http.get(Uri.parse(url),
       headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },);


      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _funcionarios  = data.map((json) => Funcionarios.fromJson(json)).toList();
        _carregando = false;
        notifyListeners();
      
      } else {
        _carregando = false;
         notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }



  }