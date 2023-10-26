import 'dart:convert';

import 'package:frontend/classes/companies.dart';
import 'package:http/http.dart' as http;

Future<List<Company>> getAllUsers() async => http
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

Future<String> createUser(List<Company> user) => http.post(
        Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/company/new"),
        body: {companyToJson(user)}).then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return body;
      } else {
        return utf8.decode(res.bodyBytes);
      }
    });
