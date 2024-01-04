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
  String sexo;
  DateTime fechaNacimiento;
  String telefono;
  String descripcionPersonal;
  String estado;
  String usuario;
  String password;
  String confirmPassword;
  int v;

  User({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.rol,
    required this.sexo,
    required this.fechaNacimiento,
    required this.telefono,
    required this.descripcionPersonal,
    required this.estado,
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
        sexo: json["sexo"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        telefono: json["telefono"],
        descripcionPersonal: json["descripcionPersonal"],
        estado: json['estado'],
        usuario: json["usuario"],
        password: json["password"],
        confirmPassword: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "rol": rol,
        "sexo": sexo,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "telefono": telefono,
        "descripcionPersonal": descripcionPersonal,
        "estado": estado,
        "usuario": usuario,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
