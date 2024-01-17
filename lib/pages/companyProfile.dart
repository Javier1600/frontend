// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors, unnecessary_string_interpolations, avoid_unnecessary_containers, prefer_void_to_null, prefer_const_literals_to_create_immutables, deprecated_member_use, use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/userPhoto.dart';
import 'package:frontend/pages/addViewJobs.dart';
import 'package:frontend/pages/editCompanyProfile.dart';
import 'package:frontend/pages/explorePageCompany.dart';
import 'package:frontend/pages/homePageCompany.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/services/company.services.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProfile extends StatefulWidget {
  Company loggedCompany;
  CompanyProfile(this.loggedCompany, {super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  File? imagen;
  String imageUrl = '';

  Future setImage(int opction) async {
    final picker = ImagePicker();
    XFile? pickedFile;
    if (opction == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      pickedFile != null
          ? {imagen = File(pickedFile.path)}
          : print("Selecciona un archivo válido");
    });

    //Guardo la imagen en el server
    subirFoto(widget.loggedCompany, pickedFile!);
    Navigator.of(context).pop();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return CompanyProfile(widget.loggedCompany);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
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
                child: FutureBuilder(
                  future: getCompanyPhoto(widget.loggedCompany.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      UserPhoto profileImage = snapshot.data;
                      return ClipOval(
                          child: Image.network(
                        profileImage.foto,
                        fit: BoxFit.cover,
                      ));
                    } else if (snapshot.hasError) {
                      return imagen == null
                          ? ClipOval(
                              child: Image(
                              image: AssetImage(
                                  'assets/img/ImagenUsuarioDefecto.jpg'),
                              fit: BoxFit.contain,
                            ))
                          : ClipOval(
                              child: Image.file(
                              imagen!,
                              fit: BoxFit.cover,
                            ));
                    }
                    return imagen == null
                        ? ClipOval(
                            child: Image(
                            image: AssetImage(
                                'assets/img/ImagenUsuarioDefecto.jpg'),
                            fit: BoxFit.contain,
                          ))
                        : ClipOval(
                            child: Image.file(
                            imagen!,
                            fit: BoxFit.cover,
                          ));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(206, 144, 32, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return homePageCompany(widget.loggedCompany);
                              }));
                            },
                            child: Text(
                              "Inicio",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(206, 144, 32, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return ExplorePageCompany(widget.loggedCompany);
                              }));
                            },
                            child: Text(
                              "Explorar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(206, 144, 32, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<Null>(
                                      builder: (BuildContext context) {
                                return RegisteredJobs(widget.loggedCompany);
                              }));
                            },
                            child: Text(
                              "Mis empleos",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700),
                            )),
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(206, 144, 32, 1)),
                                minimumSize:
                                    MaterialStateProperty.all(Size(200, 70)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0)))),
                            onPressed: () {
                              _onCloseSession(context);
                            },
                            child: Text(
                              "Cerrar sesión",
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
                            child: FutureBuilder(
                              future: getCompanyPhoto(widget.loggedCompany.id),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  UserPhoto profileImage = snapshot.data;
                                  return ClipOval(
                                      child: Image.network(
                                    profileImage.foto,
                                    fit: BoxFit.cover,
                                  ));
                                } else if (snapshot.hasError) {
                                  return imagen == null
                                      ? ClipOval(
                                          child: Image(
                                          image: AssetImage(
                                              'assets/img/ImagenUsuarioDefecto.jpg'),
                                          fit: BoxFit.contain,
                                        ))
                                      : ClipOval(
                                          child: Image.file(
                                          imagen!,
                                          fit: BoxFit.cover,
                                        ));
                                }
                                return imagen == null
                                    ? ClipOval(
                                        child: Image(
                                        image: AssetImage(
                                            'assets/img/ImagenUsuarioDefecto.jpg'),
                                        fit: BoxFit.contain,
                                      ))
                                    : ClipOval(
                                        child: Image.file(
                                        imagen!,
                                        fit: BoxFit.cover,
                                      ));
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () => {AlertaFoto(context)},
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.edit_square,
                                                  color: Colors.black,
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.all(5)),
                                                Text("Editar imagen",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700))
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit_square,
                                  color: Colors.black38,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute<Null>(
                                          builder: (BuildContext context) {
                                    return EditCompanyProfile(
                                        widget.loggedCompany);
                                  }));
                                },
                              ),
                            ],
                          ),
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
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return homePageCompany(widget.loggedCompany);
    }));
    return true;
  }

  _onCloseSession(BuildContext context) {
    showDialog(
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
  }

  AlertaFoto(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setImage(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Tomar una foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.camera_alt_outlined)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setImage(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Seleccionar una foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(Icons.image_outlined)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Cancelar",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
