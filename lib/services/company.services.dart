// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/userPhoto.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<List<Company>> getAllCompanies() async => http
        .get(
            Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/companies"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return companyFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });
Future<List<Company>> getCompany(idCompany) async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/company/$idCompany"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return companyFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createcompany(Company company) async {
  try {
    var response = await http.post(
        Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/company/new'),
        body: {
          'nombreEmpresa': company.nombreEmpresa,
          'correo': company.correo,
          'direccion': company.direccion,
          'telefono': company.telefono,
          'descripcion': company.descripcion,
          'valores': company.valores,
          'rol': company.rol,
          'estado': company.estado,
          'usuario': company.usuario,
          'password': company.password,
          'confirmPassword': company.confirmPassword,
        });
    print(response.body);
  } catch (e) {
    print(e);
  }
}

void editCompany(Company company) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/company/${company.id}'),
        body: {
          'id': company.id,
          'nombreEmpresa': company.nombreEmpresa,
          'correo': company.correo,
          'direccion': company.direccion,
          'telefono': company.telefono,
          'descripcion': company.descripcion,
          'valores': company.valores,
          'estado': company.estado,
          'rol': company.rol,
          'usuario': company.usuario,
          'password': company.password,
        });
    print(response.body);
  } catch (e) {
    print(e);
  }
}

void subirFoto(Company company, XFile image) async {
  var formData = http.MultipartRequest(
      'PUT',
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/company/foto/${company.id}'));
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

Future<UserPhoto> getCompanyPhoto(userId) async => http
        .get(Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/company/foto/$userId'))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return userPhotoFromJson(body);
      } else {
        throw Exception('Conexión fallida');
      }
    });
