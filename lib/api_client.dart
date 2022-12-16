import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:tracequal/objetos.dart';

class ApiClient{

  final String url = 'http://sheikav.net:3000';
  final Map<String, String> _jsonHeaders = {
  'Content-Type': 'application/json; charset=UTF-8'};

  Future<Login> login(String username, String password) async{
    Uri uri = Uri.parse('$url/login');
    final response = await http.post(
      uri,
      headers: _jsonHeaders,
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );
    final data = Login.fromJson(jsonDecode(response.body));
    return data;
  }

  Future<List<Proyecto>> consultarProyectos(String userid) async{
    Uri uri = Uri.parse('$url/proyectos/$userid');
    final response = await http.get(uri);
    return listaProyectos(response.body);
  }

  List<Proyecto> listaProyectos(String responseBody){
    final parsed = json.decode(responseBody);
    List<Proyecto> proyectos = [];
    parsed["data"].forEach((proyecto) => (
        proyectos.add(Proyecto.fromJson(proyecto))));
    return proyectos;
  }

  Future<Proyecto> nuevoProyecto(Proyecto proyecto, String userid) async {
    Uri uri = Uri.parse('$url/insertar/proyecto/$userid');
    final response = await http.post(uri,
        headers: _jsonHeaders,
        body: jsonEncode(
          proyecto.toJson(),
        ));
    return proyecto;
  }
}