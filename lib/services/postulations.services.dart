// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:frontend/classes/postulations.dart';
import 'package:http/http.dart' as http;

Future<List<Postulation>> getAllPostulations() async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/postulations"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return postulationFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

Future<List<Postulation>> getUserPostulations(idUsuario) async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/postulations/user/$idUsuario"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return postulationFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

Future<List<Postulation>> getJobPostulations(idEmpleo) async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/postulations/job/$idEmpleo"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return postulationFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });
void createPostulation(Postulation postulation) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/postulation/new'),
        body: {
          "idUsuario": postulation.idUsuario,
          "idEmpleo": postulation.idEmpleo,
          "estado": postulation.estado,
          "fechaPostulacion": postulation.fechaPostulacion.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void editPostulation(Postulation postulation) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/postulation/${postulation.id}'),
        body: {
          "id": postulation.id,
          "idUsuario": postulation.idUsuario,
          "idEmpleo": postulation.idEmpleo,
          "estado": postulation.estado,
          "fechaPostulacion": postulation.fechaPostulacion.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void deletePostulation(Postulation postulation) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/postulation/${postulation.id}'),
    );
  } catch (e) {
    print(e);
  }
}
