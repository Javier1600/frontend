// To parse this JSON data, do
//
//     final postulation = postulationFromJson(jsonString);

import 'dart:convert';

List<Postulation> postulationFromJson(String str) => List<Postulation>.from(
    json.decode(str).map((x) => Postulation.fromJson(x)));

String postulationToJson(List<Postulation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Postulation {
  String id;
  String idUsuario;
  String idEmpleo;
  String estado;
  String estadoPostulacion;
  DateTime fechaPostulacion;
  int v;

  Postulation({
    required this.id,
    required this.idUsuario,
    required this.idEmpleo,
    required this.estado,
    required this.estadoPostulacion,
    required this.fechaPostulacion,
    required this.v,
  });

  factory Postulation.fromJson(Map<String, dynamic> json) => Postulation(
        id: json["_id"],
        idUsuario: json["idUsuario"],
        idEmpleo: json["idEmpleo"],
        estado: json["estado"],
        estadoPostulacion: json["estadoPostulacion"],
        fechaPostulacion: DateTime.parse(json["fechaPostulacion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idUsuario": idUsuario,
        "idEmpleo": idEmpleo,
        "estado": estado,
        "estadoPostulacion": estadoPostulacion,
        "fechaPostulacion": fechaPostulacion.toIso8601String(),
      };
}
