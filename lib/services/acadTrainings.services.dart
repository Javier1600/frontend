// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:frontend/classes/acadTrainings.dart';
import 'package:http/http.dart' as http;

Future<List<AcadTraining>> getUserAcadTraining(idUser) async => http
        .get(Uri.parse(
      "https://0vmlb023-8000.use2.devtunnels.ms/api/acadTrainings/user/$idUser",
    ))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return acadTrainingFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createAcadTraining(AcadTraining acadTraining) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/acadTraining/new'),
        body: {
          "idInstitucion": acadTraining.idInstitucion,
          "idUsuario": acadTraining.idUsuario,
          "tituloObtenido": acadTraining.tituloObtenido,
          "fechaInicio": acadTraining.fechaInicio.toIso8601String(),
          "fechaFin": acadTraining.fechaFin.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void editAcadTraining(AcadTraining acadTraining) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/acadTraining/${acadTraining.id}'),
        body: {
          'id': acadTraining.id,
          "idInstitucion": acadTraining.idInstitucion,
          "idUsuario": acadTraining.idUsuario,
          "tituloObtenido": acadTraining.tituloObtenido,
          "fechaInicio": acadTraining.fechaInicio.toIso8601String(),
          "fechaFin": acadTraining.fechaFin.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void deleteAcadTraining(AcadTraining acadTraining) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/acadTraining/${acadTraining.id}'),
    );
  } catch (e) {
    print(e);
  }
}
