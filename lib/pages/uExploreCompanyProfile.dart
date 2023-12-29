// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_void_to_null, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/explorePageUser.dart';

class UserExploreCompanyProfile extends StatefulWidget {
  User user;
  Company reqCompany;
  UserExploreCompanyProfile(this.user, this.reqCompany, {super.key});

  @override
  State<UserExploreCompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<UserExploreCompanyProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            "Empresa",
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
                          widget.reqCompany.nombreEmpresa,
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
                              widget.reqCompany.direccion,
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
                              widget.reqCompany.correo,
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
                                '${widget.reqCompany.telefono}',
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
                              widget.reqCompany.descripcion,
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
                              widget.reqCompany.valores,
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
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return ExplorePageUser(widget.user);
    }));
    return true;
  }
}
