// ignore_for_file: file_names, must_be_immutable, deprecated_member_use, non_constant_identifier_names, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last, prefer_void_to_null

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/externalCompany.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/services/externalCompany.services.dart';
import 'package:url_launcher/url_launcher.dart';

class UserExternalCompanies extends StatefulWidget {
  User loggedUser;
  UserExternalCompanies(this.loggedUser, {super.key});

  @override
  State<UserExternalCompanies> createState() => _UserExternalCompaniesState();
}

AbrirURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

class _UserExternalCompaniesState extends State<UserExternalCompanies> {
  //Variable que contiene todos las publicaciones actuales de la base
  late Future<List<ExternalCompany>> externalCompanies;
  //Variable para iterar la lista de usuarios de la base
  List<ExternalCompany>? eCList = [];
  @override
  void initState() {
    externalCompanies = getAllExternalCompanies();
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
                  "Publicaciones registradas",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                      color: Color.fromRGBO(226, 144, 32, 1),
                      fontFamily: 'PlaypenSans'),
                ),
              ]),
            ),
            FutureBuilder(
              future: externalCompanies,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  eCList = snapshot.data;
                  return Column(
                    children: ExternalCompanies(
                      eCList,
                      context,
                      widget.loggedUser,
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
              },
            )
          ]),
        ),
      ),
    );
  }
}

List<Widget> ExternalCompanies(
    List<ExternalCompany>? eCompanies, BuildContext context, User loggedUser) {
  List<Widget> cRet = [];
  if (eCompanies != null) {
    for (ExternalCompany eC in eCompanies) {
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
              '${eC.nombreEmpresa}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.clip),
              maxLines: 3,
            ),
            Text(
              'Descripción: ',
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              eC.descripcionPublicacion,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'URL: ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                    AbrirURL(eC.url);
                  },
                  child: Text(
                    'Ver página',
                    style: TextStyle(
                      color: Color.fromRGBO(1, 167, 211, 1),
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ));
      cRet.add(Padding(padding: EdgeInsets.only(top: 10)));
    }
  }
  if (cRet.isEmpty) {
    cRet.add(Container(
      alignment: Alignment.center,
      child: Text("Sin publicaciones",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
    ));
  }
  return cRet;
}
