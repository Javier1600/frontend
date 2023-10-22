// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String id;
  String nombre;
  String apellido;
  String rol;
  DateTime fechaNacimiento;
  String telefono;
  String usuario;
  String password;
  String confirmPassword;
  int v;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.rol,
    required this.fechaNacimiento,
    required this.telefono,
    required this.usuario,
    required this.password,
    required this.confirmPassword,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        rol: json["rol"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        telefono: json["telefono"],
        usuario: json["usuario"],
        password: json["password"],
        confirmPassword: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "rol": rol,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "telefono": telefono,
        "usuario": usuario,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
