// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:frontend/classes/certifications.dart';
import 'package:http/http.dart' as http;

Future<List<Certification>> getUserCertifications(idUser) async => http
        .get(Uri.parse(
            "https://0vmlb023-8000.use2.devtunnels.ms/api/certification/user/$idUser"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return certificationFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createCertification(Certification certification) async {
  try {
    var response = await http.post(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/certification/new'),
        body: {
          'titulo': certification.titulo,
          'url': certification.url,
          'idUsuario': certification.idUsuario,
          'fechaExpedicion': certification.fechaExpedicion.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void editCertification(Certification certification) async {
  try {
    var response = await http.put(
        Uri.parse(
            'https://0vmlb023-8000.use2.devtunnels.ms/api/certification/${certification.id}'),
        body: {
          'id': certification.id,
          'titulo': certification.titulo,
          'url': certification.url,
          'idUsuario': certification.idUsuario,
          'fechaExpedicion': certification.fechaExpedicion.toIso8601String(),
        });
  } catch (e) {
    print(e);
  }
}

void deleteCertification(Certification certification) async {
  try {
    var response = await http.delete(
      Uri.parse(
          'https://0vmlb023-8000.use2.devtunnels.ms/api/certification/${certification.id}'),
    );
  } catch (e) {
    print(e);
  }
}
