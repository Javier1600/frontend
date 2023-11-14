// ignore_for_file: avoid_print, non_constant_identifier_names

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
