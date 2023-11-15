// To parse this JSON data, do
//
//     final workExperience = workExperienceFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<WorkExperience> workExperienceFromJson(String str) =>
    List<WorkExperience>.from(
        json.decode(str).map((x) => WorkExperience.fromJson(x)));

String workExperienceToJson(List<WorkExperience> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkExperience {
  String id;
  String puesto;
  String descripcionResponsabilidades;
  String ambitoLaboral;
  String empresa;
  DateTime fechaInicio;
  DateTime fechaFin;
  String idUsuario;
  int v;

  WorkExperience({
    required this.id,
    required this.puesto,
    required this.descripcionResponsabilidades,
    required this.ambitoLaboral,
    required this.empresa,
    required this.fechaInicio,
    required this.fechaFin,
    required this.idUsuario,
    required this.v,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
        id: json["_id"],
        puesto: json["puesto"],
        descripcionResponsabilidades: json["descripcionResponsabilidades"],
        ambitoLaboral: json["ambitoLaboral"],
        empresa: json["empresa"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        idUsuario: json["idUsuario"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "puesto": puesto,
        "descripcionResponsabilidades": descripcionResponsabilidades,
        "ambitoLaboral": ambitoLaboral,
        "empresa": empresa,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
        "idUsuario": idUsuario,
      };
}
