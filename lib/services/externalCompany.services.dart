// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'package:frontend/classes/externalCompany.dart';
import 'package:http/http.dart' as http;

Future<List<ExternalCompany>> getAllExternalCompanies() async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/externalCompanies"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return externalCompanyFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createExternalCompany(ExternalCompany company) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/externalCompany/new'),
        body: {
          'nombreEmpresa': company.nombreEmpresa,
          'descripcionPublicacion': company.descripcionPublicacion,
          'url': company.url
        });
  } catch (e) {
    print(e);
  }
}

void editExternalCompany(ExternalCompany company) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/externalCompany/${company.id}'),
        body: {
          'id': company.id,
          'nombreEmpresa': company.nombreEmpresa,
          'descripcionPublicacion': company.descripcionPublicacion,
          'url': company.url
        });
  } catch (e) {
    print(e);
  }
}

void deleteExternalCompany(ExternalCompany company) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/externalCompany/${company.id}'),
    );
  } catch (e) {
    print(e);
  }
}
