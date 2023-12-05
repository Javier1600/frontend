// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:frontend/classes/companies.dart';
import 'package:http/http.dart' as http;

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
          'rol': company.rol,
          'usuario': company.usuario,
          'password': company.password,
        });
    print(response.body);
  } catch (e) {
    print(e);
  }
}
