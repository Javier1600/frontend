// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:frontend/classes/users.dart';

Future<List<User>> getAllUsers() async => http
        .get(Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/users'))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return userFromJson(body);
      } else {
        throw Exception('Conexión fallida');
      }
    });

void createUser(User user) async {
  try {
    var response = await http.post(
        Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/user/new'),
        body: {
          'nombre': user.nombre,
          'apellido': user.apellido,
          'rol': user.rol,
          'sexo': user.sexo,
          'fechaNacimiento': user.fechaNacimiento.toIso8601String(),
          'telefono': user.telefono,
          'usuario': user.usuario,
          'password': user.password,
          'confirmPassword': user.password
        });
  } catch (e) {
    print(e);
  }
}
