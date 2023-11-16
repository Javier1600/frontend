// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_void_to_null, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';

class CompanyProfile extends StatefulWidget {
  Company loggedCompany;
  CompanyProfile(this.loggedCompany, {super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
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
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueAccent, width: 2.0)),
              width: 200,
              height: 200,
              child: const ClipOval(
                  child: Image(
                image: AssetImage('assets/img/empresa.png'),
                fit: BoxFit.contain,
              )),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('${widget.loggedCompany.nombreEmpresa}'),
            ),
            Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
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
                            color: Color.fromRGBO(206, 144, 32, 1),
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
          "Mi perfil",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(15.0, 15.0),
                            blurRadius: 15.0)
                      ]),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          width: 150,
                          height: 150,
                          child: Image(
                            image: AssetImage('assets/img/empresa.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        widget.loggedCompany.nombreEmpresa,
                        style: TextStyle(
                            color: Color.fromRGBO(1, 167, 211, 1),
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Dirección: ',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.loggedCompany.direccion,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Correo electrónico: ',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.loggedCompany.correo,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Contacto: ',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '${widget.loggedCompany.telefono}',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Descripción general: ',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.loggedCompany.descripcion,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Valores de sus empleados: ',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.loggedCompany.valores,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
