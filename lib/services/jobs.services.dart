// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:frontend/classes/jobs.dart';
import 'package:http/http.dart' as http;

Future<List<Job>> getAllJobs() async => http
        .get(Uri.parse("https://0vmlb023-8000.use2.devtunnels.ms/api/jobs"))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return jobFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

Future<List<Job>> getCompanyPublishedJobs(idCompany) async => http
        .get(Uri.parse(
      "https://0vmlb023-8000.use2.devtunnels.ms/api/jobs/company/$idCompany",
    ))
        .then((res) {
      if (res.statusCode == 200) {
        String body = utf8.decode(res.bodyBytes);
        return jobFromJson(body);
      } else {
        throw Exception("Conexión fallida");
      }
    });

void createJob(Job job) async {
  try {
    var response = await http.post(
        Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/job/new'),
        body: {
          "puesto": job.puesto,
          "idEmpresa": job.idEmpresa,
          "descripcion": job.descripcion,
          "formacionAcademica": job.formacionAcademica,
          "conocimientos": job.conocimientos,
          "experiencia": job.experiencia,
          "aptitudes": job.aptitudes,
          "modalidad": job.modalidad,
          "numeroVacantes": job.numeroVacantes,
          "estado": job.estado
        });
  } catch (e) {
    print(e);
  }
}

void editJob(Job job) async {
  try {
    var response = await http.put(
        Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/job/${job.id}'),
        body: {
          "id": job.id,
          "puesto": job.puesto,
          "idEmpresa": job.idEmpresa,
          "descripcion": job.descripcion,
          "formacionAcademica": job.formacionAcademica,
          "conocimientos": job.conocimientos,
          "experiencia": job.experiencia,
          "aptitudes": job.aptitudes,
          "modalidad": job.modalidad,
          "numeroVacantes": job.numeroVacantes,
          "estado": job.estado
        });
  } catch (e) {
    print(e);
  }
}

void deleteJob(Job job) async {
  try {
    var response = await http.delete(
      Uri.parse('https://0vmlb023-8000.use2.devtunnels.ms/api/job/${job.id}'),
    );
  } catch (e) {
    print(e);
  }
}
