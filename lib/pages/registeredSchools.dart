// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/schools.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/addAcadTraining.dart';
import 'package:frontend/pages/addSchool.dart';
import 'package:frontend/services/schools.services.dart';

class RegisteredSchools extends StatefulWidget {
  User user;

  RegisteredSchools(this.user, {super.key});

  @override
  State<RegisteredSchools> createState() => _ResgisteredSchoolsState();
}

class _ResgisteredSchoolsState extends State<RegisteredSchools> {
  //Variable que contiene todos los certificados registrados del usuario de la base
  late Future<List<School>> schools;
  //Variable para iterar la lista de usuarios de la base
  List<School>? sList = [];

  @override
  void initState() {
    schools = getAllSchools();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Color.fromRGBO(1, 167, 211, 1)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(children: [
            Center(
              child: Column(children: [
                const Text(
                  "Empleos",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40.0,
                      color: Color.fromRGBO(1, 167, 211, 1)),
                  textAlign: TextAlign.center,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: "Chavez",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.0,
                        color: Color.fromRGBO(226, 144, 32, 1),
                        fontFamily: 'PlaypenSans'),
                  ),
                  TextSpan(
                    text: "pamba",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.0,
                        color: Color.fromRGBO(1, 167, 211, 1),
                        fontFamily: 'PlaypenSans'),
                  ),
                ])),
                Divider(
                  color: Color.fromRGBO(226, 144, 32, 1),
                ),
                Text(
                  "Si no encuentras tu institución, puedes agregarla pulsando el botón",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontFamily: 'PlaypenSans'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return AddSchool(widget.user);
                    }));
                  },
                  child: Text(
                    'Agregar',
                    style: TextStyle(
                        color: Color.fromRGBO(1, 167, 211, 1),
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                )
              ]),
            ),
            FutureBuilder(
              future: schools,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  sList = snapshot.data;
                  return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Container(
                                  child: Column(
                                children: Schools(sList, context, widget.user),
                              )))));
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
                            color: Color.fromRGBO(1, 167, 211, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      CircularProgressIndicator(
                        color: Color.fromRGBO(1, 167, 211, 1),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}

List<Widget> Schools(List<School>? schools, BuildContext context, User user) {
  List<Widget> cRet = [];
  if (schools != null) {
    for (School school in schools) {
      cRet.add(Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 10),
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
            Text(
              '${school.nombreInstitucion}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Container(
                alignment: Alignment.topCenter,
                child: Text(
                  '${school.ubicacion}',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      overflow: TextOverflow.clip),
                  maxLines: 4,
                )),
            Container(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return AddAcadTraining(user, school);
                  }));
                },
                child: Text(
                  'Seleccionar',
                  style: TextStyle(
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            )
          ],
        ),
      ));
      cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  return cRet;
}
