// To parse this JSON data, do
//
//     final school = schoolFromJson(jsonString);

import 'dart:convert';

List<School> schoolFromJson(String str) =>
    List<School>.from(json.decode(str).map((x) => School.fromJson(x)));

String schoolToJson(List<School> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class School {
  String id;
  String nombreInstitucion;
  String ubicacion;
  int v;

  School({
    required this.id,
    required this.nombreInstitucion,
    required this.ubicacion,
    required this.v,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["_id"],
        nombreInstitucion: json["nombreInstitucion"],
        ubicacion: json["ubicacion"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombreInstitucion": nombreInstitucion,
        "ubicacion": ubicacion,
      };
}
