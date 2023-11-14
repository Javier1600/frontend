// To parse this JSON data, do
//
//     final certification = certificationFromJson(jsonString);

import 'dart:convert';

List<Certification> certificationFromJson(String str) =>
    List<Certification>.from(
        json.decode(str).map((x) => Certification.fromJson(x)));

String certificationToJson(List<Certification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Certification {
  String id;
  String titulo;
  String url;
  String idUsuario;
  DateTime fechaExpedicion;
  int v;

  Certification({
    required this.id,
    required this.titulo,
    required this.url,
    required this.idUsuario,
    required this.fechaExpedicion,
    required this.v,
  });

  factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        id: json["_id"],
        titulo: json["titulo"],
        url: json["url"],
        idUsuario: json["idUsuario"],
        fechaExpedicion: DateTime.parse(json["fechaExpedicion"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "titulo": titulo,
        "url": url,
        "idUsuario": idUsuario,
        "fechaExpedicion": fechaExpedicion.toIso8601String(),
      };
}
