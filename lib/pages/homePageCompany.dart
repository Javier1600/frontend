// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/pages/companyProfile.dart';

class homePageCompany extends StatefulWidget {
  Company loggedCompany;
  homePageCompany(this.loggedCompany, {super.key});
  @override
  State<homePageCompany> createState() => _homePageCompanyState();
}

class _homePageCompanyState extends State<homePageCompany> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('assets/img/empresa.png'),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(206, 144, 32, 1)),
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return CompanyProfile(widget.loggedCompany);
                        }));
                      },
                      child: Text(
                        "Mi perfil",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ]),
            )
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(206, 144, 32, 1),
        title: const Text(
          'Resumen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}