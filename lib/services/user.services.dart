// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:frontend/classes/users.dart';
import 'package:image_picker/image_picker.dart';

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
          'descripcionPersonal': user.descripcionPersonal,
          'estado': user.estado,
          'usuario': user.usuario,
          'password': user.password,
          'confirmPassword': user.password
        });
  } catch (e) {
    print(e);
  }
}

void editUser(User user) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/user/${user.id}'),
        body: {
          'id': user.id,
          'nombre': user.nombre,
          'apellido': user.apellido,
          'rol': user.rol,
          'sexo': user.sexo,
          'fechaNacimiento': user.fechaNacimiento.toIso8601String(),
          'telefono': user.telefono,
          'descripcionPersonal': user.descripcionPersonal,
          'estado': user.estado,
          'usuario': user.usuario,
          'password': user.password,
        });
  } catch (e) {
    print(e);
  }
}

void subirFoto(User user, XFile image) async {
  var formData = http.MultipartRequest(
      'PUT',
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/user/foto/${user.id}'));
  formData.files.add(await http.MultipartFile.fromPath('foto', image.path));
  try {
    final response = await formData.send();
    if (response.statusCode == 200) {
      print('Formulario enviado con éxito');
    } else {
      print(
          'Error al enviar el formulario. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error de red: $error');
  }
}

Future<String> getUserPhoto(idUser) async {
  var response = await http.get(Uri.parse(
      'https://0vmlb023-8000.use2.devtunnels.ms/api/user/foto/$idUser'));

  return response.body
      .replaceAll("{", "")
      .replaceAll("}", "")
      .replaceAll("\":", "")
      .replaceAll("\"", "")
      .replaceAll("foto", "");
}
