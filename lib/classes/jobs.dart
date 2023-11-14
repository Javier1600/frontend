// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'dart:convert';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  String id;
  String idEmpresa;
  String descripcion;
  String conocimientos;
  String aptitudes;
  String numeroVacantes;
  int v;

  Job({
    required this.id,
    required this.idEmpresa,
    required this.descripcion,
    required this.conocimientos,
    required this.aptitudes,
    required this.numeroVacantes,
    required this.v,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        idEmpresa: json["idEmpresa"],
        descripcion: json["descripcion"],
        conocimientos: json["conocimientos"],
        aptitudes: json["aptitudes"],
        numeroVacantes: json["numeroVacantes"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "idEmpresa": idEmpresa,
        "descripcion": descripcion,
        "conocimientos": conocimientos,
        "aptitudes": aptitudes,
        "numeroVacantes": numeroVacantes,
      };
}
