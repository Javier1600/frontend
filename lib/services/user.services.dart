import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:frontend/classes/users.dart';

Future<List<User>> getAllUsers() async => http
        .get(Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/users"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return userFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

Future<String> createUser(List<User> user) => http.post(
        Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/user/new"),
        body: {userToJson(user)}).then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return body;
      } else {
        return utf8.decode(res.bodyBytes);
      }
    });
