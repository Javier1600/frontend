// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Company {
  String id;
  String nombreEmpresa;
  String correo;
  String direccion;
  String telefono;
  String descripcion;
  String valores;
  String rol;
  String estado;
  String usuario;
  String password;
  String confirmPassword;
  int v;

  Company({
    required this.id,
    required this.nombreEmpresa,
    required this.correo,
    required this.direccion,
    required this.telefono,
    required this.descripcion,
    required this.valores,
    required this.rol,
    required this.estado,
    required this.usuario,
    required this.password,
    required this.confirmPassword,
    required this.v,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        nombreEmpresa: json["nombreEmpresa"],
        correo: json["correo"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        descripcion: json["descripcion"],
        valores: json["valores"],
        rol: json["rol"],
        estado: json["estado"],
        usuario: json["usuario"],
        password: json["password"],
        confirmPassword: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "nombreEmpresa": nombreEmpresa,
        "correo": correo,
        "direccion": direccion,
        "telefono": telefono,
        "descripcion": descripcion,
        "valores": valores,
        "rol": rol,
        "estado": estado,
        "usuario": usuario,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
