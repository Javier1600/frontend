// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null, unnecessary_string_interpolations, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/pages/addJob.dart';
import 'package:frontend/pages/addViewJobs.dart';
import 'package:frontend/pages/companyProfile.dart';
import 'package:frontend/pages/loginUser.dart';

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
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              _onBack(context);
            },
          ),
          backgroundColor: Color.fromRGBO(206, 144, 32, 1),
          title: const Text(
            'Resumen',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Center(
                  child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return CompanyProfile(widget.loggedCompany);
                          }));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.28,
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.black45, width: 4.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(206, 144, 32, 1),
                                ),
                                width: 100,
                                height: 100,
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/empresaPerfil.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Mi perfil",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return RegisteredJobs(widget.loggedCompany);
                          }));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.28,
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.black45, width: 4.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(206, 144, 32, 1),
                                ),
                                width: 100,
                                height: 100,
                                child: Image(
                                  image: AssetImage('assets/img/compania.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Empleos",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return AddJob(widget.loggedCompany);
                          }));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.28,
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.black45, width: 4.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(206, 144, 32, 1),
                                ),
                                width: 100,
                                height: 100,
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/publicarEmpleo.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Publicar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      GestureDetector(
                        onTap: () {
                          _onBack(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.28,
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.black45, width: 4.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(8.0, 8.0),
                                    blurRadius: 15.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(1, 167, 211, 1),
                                ),
                                width: 100,
                                height: 100,
                                child: Image(
                                  image:
                                      AssetImage('assets/img/cerrarSesion.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Cerrar sesión",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
            )),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¿Está  seguro de cerrar sesión?",
                style: TextStyle(
                    color: Color.fromRGBO(226, 144, 32, 1),
                    fontWeight: FontWeight.w700)),
            backgroundColor: Colors.white70,
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                        return loginPage();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60),
                    child: Text(
                      'Sí',
                      style: TextStyle(
                          color: Color.fromRGBO(1, 167, 211, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60),
                    child: Text(
                      'No',
                      style: TextStyle(
                          color: Color.fromRGBO(1, 167, 211, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    return exitApp;
  }
}
