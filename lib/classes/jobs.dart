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
  String puesto;
  String idEmpresa;
  String descripcion;
  String formacionAcademica;
  String experiencia;
  String conocimientos;
  String aptitudes;
  String modalidad;
  String numeroVacantes;
  String estado;
  int v;

  Job({
    required this.id,
    required this.puesto,
    required this.idEmpresa,
    required this.descripcion,
    required this.formacionAcademica,
    required this.experiencia,
    required this.conocimientos,
    required this.aptitudes,
    required this.modalidad,
    required this.numeroVacantes,
    required this.estado,
    required this.v,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        puesto: json['puesto'],
        idEmpresa: json["idEmpresa"],
        descripcion: json["descripcion"],
        formacionAcademica: json["formacionAcademica"],
        experiencia: json['experiencia'],
        conocimientos: json["conocimientos"],
        aptitudes: json["aptitudes"],
        modalidad: json["modalidad"],
        numeroVacantes: json["numeroVacantes"],
        estado: json["estado"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "puesto": puesto,
        "idEmpresa": idEmpresa,
        "descripcion": descripcion,
        "formacionAcademica": formacionAcademica,
        "experiencia": experiencia,
        "conocimientos": conocimientos,
        "aptitudes": aptitudes,
        "modalidad": modalidad,
        "numeroVacantes": numeroVacantes,
        "estado": estado
      };
}
