// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/jobs.dart';
import 'package:frontend/services/company.services.dart';

class JobDetails extends StatefulWidget {
  Job job;
  JobDetails(this.job, {super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  //Variable para  contener las empresas de la base
  late Future<List<Company>> companies;
  late List<Company>? cList = [];
  //Variable para contener los detalles de la empresa
  Company? company;
  @override
  void initState() {
    companies = getAllCompanies();
    super.initState();
  }

  Company? getCompanyDetails(List<Company>? CompList, String idEmpresa) {
    //Variable para contener los detalles de la empresa
    Company? company;
    for (Company c in CompList!) {
      if (c.id == idEmpresa) {
        company = c;
      }
    }
    return company;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(226, 144, 32, 1),
          title: const Text(
            'Detalle empleo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        body: FutureBuilder(
            future: companies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                cList = snapshot.data;
                company = getCompanyDetails(cList, widget.job.idEmpresa);
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(children: [
                            Row(),
                            Container(
                              child: Text(
                                "${widget.job.puesto}",
                                style: TextStyle(
                                    color: Color.fromRGBO(226, 144, 32, 1),
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Empresa",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              company!.nombreEmpresa,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Modalidad ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${widget.job.modalidad}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Disponibles ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${widget.job.numeroVacantes}  Vacantes",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              "Ubicación",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              company!.direccion,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              'Descripción general',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '${widget.job.descripcion}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 22,
                                  overflow: TextOverflow.clip),
                              maxLines: 10,
                            ),
                          ]),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            children: [
                              Row(),
                              Text(
                                'Formación Académica',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.job.formacionAcademica}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 22,
                                    overflow: TextOverflow.clip),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            children: [
                              Row(),
                              Text(
                                'Conocimientos requeridos',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.job.conocimientos}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 22,
                                    overflow: TextOverflow.clip),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Container(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            children: [
                              Row(),
                              Text(
                                'Aptitudes requeridas',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                '${widget.job.aptitudes}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 22,
                                    overflow: TextOverflow.clip),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                      ]),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Obteniendo datos",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }));
  }
}
