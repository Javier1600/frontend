// ignore_for_file: file_names
import 'dart:convert';

List<ExternalCompany> externalCompanyFromJson(String str) =>
    List<ExternalCompany>.from(
        json.decode(str).map((x) => ExternalCompany.fromJson(x)));

String externalCompanyToJson(List<ExternalCompany> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExternalCompany {
  String id;
  String nombreEmpresa;
  String descripcionPublicacion;
  String url;
  int v;

  ExternalCompany({
    required this.id,
    required this.nombreEmpresa,
    required this.descripcionPublicacion,
    required this.url,
    required this.v,
  });

  factory ExternalCompany.fromJson(Map<String, dynamic> json) =>
      ExternalCompany(
        id: json["_id"],
        nombreEmpresa: json["nombreEmpresa"],
        descripcionPublicacion: json["descripcionPublicacion"],
        url: json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombreEmpresa": nombreEmpresa,
        "descripcionPublicacion": descripcionPublicacion,
        "url": url,
        "__v": v,
      };
}
