// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:frontend/classes/schools.dart';
import 'package:http/http.dart' as http;

Future<List<School>> getAllSchools() async => http
        .get(Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/schools"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return schoolFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createSchool(School school) async {
  try {
    var response = await http.post(
        Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/school/new'),
        body: {
          'nombreInstitucion': school.nombreInstitucion,
          'ubicacion': school.ubicacion
        });
  } catch (e) {
    print(e);
  }
}

void editSchool(School school) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/school/${school.id}'),
        body: {
          'id': school.id,
          'nombreInstitucion': school.nombreInstitucion,
          'ubicacion': school.ubicacion
        });
  } catch (e) {
    print(e);
  }
}

void deleteSchool(School school) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/school/${school.id}'),
    );
  } catch (e) {
    print(e);
  }
}
