// ignore_for_file: avoid_print, non_constant_identifier_names, file_names, unused_local_variable

import 'dart:convert';
import 'package:frontend/classes/workExperience.dart';
import 'package:http/http.dart' as http;

Future<List<WorkExperience>> getUserWorkExperiences(idUser) async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/workExperiences/user/$idUser"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return workExperienceFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createWorkExp(WorkExperience exp) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/workExperience/new'),
        body: {
          "descripcionResponsabilidades": exp.descripcionResponsabilidades,
          "ambitoLaboral": exp.ambitoLaboral,
          "empresa": exp.empresa,
          "fechaInicio": exp.fechaInicio.toIso8601String(),
          "fechaFin": exp.fechaFin.toIso8601String(),
          "idUsuario": "6531e386d6a7cc3a1698aab1",
          "puesto": exp.puesto
        });
  } catch (e) {
    print(e);
  }
}

void editWorkExp(WorkExperience exp) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/workExperience/${exp.id}'),
        body: {
          "id": exp.id,
          "descripcionResponsabilidades": exp.descripcionResponsabilidades,
          "ambitoLaboral": exp.ambitoLaboral,
          "empresa": exp.empresa,
          "fechaInicio": exp.fechaInicio.toIso8601String(),
          "fechaFin": exp.fechaFin.toIso8601String(),
          "idUsuario": "6531e386d6a7cc3a1698aab1",
          "puesto": exp.puesto
        });
  } catch (e) {
    print(e);
  }
}

void deleteWorkExp(WorkExperience exp) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/workExperience/${exp.id}'),
    );
  } catch (e) {
    print(e);
  }
}
