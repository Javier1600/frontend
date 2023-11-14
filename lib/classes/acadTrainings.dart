// To parse this JSON data, do
//
//     final acadTraining = acadTrainingFromJson(jsonString);

import 'dart:convert';

List<AcadTraining> acadTrainingFromJson(String str) => List<AcadTraining>.from(
    json.decode(str).map((x) => AcadTraining.fromJson(x)));

String acadTrainingToJson(List<AcadTraining> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AcadTraining {
  String id;
  String idInstitucion;
  String idUsuario;
  String tituloObtenido;
  DateTime fechaInicio;
  DateTime fechaFin;
  int v;

  AcadTraining({
    required this.id,
    required this.idInstitucion,
    required this.idUsuario,
    required this.tituloObtenido,
    required this.fechaInicio,
    required this.fechaFin,
    required this.v,
  });

  factory AcadTraining.fromJson(Map<String, dynamic> json) => AcadTraining(
        id: json["_id"],
        idInstitucion: json["idInstitucion"],
        idUsuario: json["idUsuario"],
        tituloObtenido: json["tituloObtenido"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idInstitucion": idInstitucion,
        "idUsuario": idUsuario,
        "tituloObtenido": tituloObtenido,
        "fechaInicio": fechaInicio.toIso8601String(),
        "fechaFin": fechaFin.toIso8601String(),
      };
}
