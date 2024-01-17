// ignore_for_file: camel_case_types, file_names, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers, prefer_void_to_null, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/classes/companies.dart';
import 'package:frontend/classes/userPhoto.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/CompanyProfileAdmin.dart';
import 'package:frontend/pages/adminPostulations.dart';
import 'package:frontend/pages/adminProfile.dart';
import 'package:frontend/pages/adminUserData.dart';
import 'package:frontend/pages/editCompanyAdmin.dart';
import 'package:frontend/pages/homePageAdmin.dart';
import 'package:frontend/pages/loginUser.dart';
import 'package:frontend/pages/userProfileUser.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/user.services.dart';

class ExplorePageAdmin extends StatefulWidget {
  User loggedUser;
  ExplorePageAdmin(this.loggedUser, {super.key});
  @override
  State<ExplorePageAdmin> createState() => _ExplorePageAdminState();
}

class _ExplorePageAdminState extends State<ExplorePageAdmin> {
  //variable que contiene todos los usuarios de la base
  late Future<List<User>> users;
  late List<User>? uList = [];
  //variable que contiene todos las companias de la base
  late Future<List<Company>> companies;
  late List<Company>? cList = [];
  @override
  void initState() {
    users = getAllUsers();
    companies = getAllCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBack(context),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 167, 211, 1),
          title: const Text(
            'Explorar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 4.0)),
                width: 200,
                height: 200,
                child: FutureBuilder(
                  future: getUserPhoto(widget.loggedUser.id),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      UserPhoto profileImage = snapshot.data;
                      return ClipOval(
                          child: Image.network(
                        profileImage.foto,
                        fit: BoxFit.cover,
                      ));
                    } else if (snapshot.hasError) {
                      return ClipOval(
                          child: Image(
                        image:
                            AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                        fit: BoxFit.contain,
                      ));
                    }
                    return ClipOval(
                        child: Image(
                      image: AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                      fit: BoxFit.contain,
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
                                        Color.fromRGBO(1, 167, 211, 1)),
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
                                return homePageAdmin(widget.loggedUser);
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
                                        Color.fromRGBO(1, 167, 211, 1)),
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
                                return AdminProfile(widget.loggedUser);
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
                                        Color.fromRGBO(1, 167, 211, 1)),
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
                                return AdminPostulations(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Empleos",
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
                                        Color.fromRGBO(1, 167, 211, 1)),
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
                                return AdminPostulations(widget.loggedUser);
                              }));
                            },
                            child: Text(
                              "Postulaciones",
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
                                        Color.fromRGBO(1, 167, 211, 1)),
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
        body: FutureBuilder(
          future: users,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              uList = snapshot.data;
              return FutureBuilder(
                future: companies,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    cList = snapshot.data;
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Usuarios",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 167, 211, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.40,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children:
                                    Users(uList, widget.loggedUser, context),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Empresas",
                                  style: TextStyle(
                                      color: Color.fromRGBO(1, 167, 211, 1),
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: Companies(
                                    cList, widget.loggedUser, context),
                              ),
                            )
                          ],
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
                              color: Color.fromRGBO(1, 167, 211, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        CircularProgressIndicator(
                          color: Color.fromRGBO(1, 167, 211, 1),
                        ),
                      ],
                    ),
                  );
                },
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
                        color: Color.fromRGBO(1, 167, 211, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  CircularProgressIndicator(
                    color: Color.fromRGBO(1, 167, 211, 1),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool> _onBack(BuildContext context) async {
    await Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return homePageAdmin(widget.loggedUser);
    }));
    return true;
  }

  Future<bool> _onCloseSession(BuildContext context) async {
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

List<Widget> Users(List<User>? users, User loggedUser, context) {
  List<Widget> uRet = [];
  for (User u in users!) {
    if (u.usuario != loggedUser.usuario) {
      uRet.add(Padding(padding: EdgeInsets.all(8)));
      uRet.add(Container(
        width: MediaQuery.of(context).size.height * 0.33,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: u.estado == "Activo" ? Colors.white : Colors.blueGrey[200],
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
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
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 4.0)),
              width: 100,
              height: 100,
              child: FutureBuilder(
                future: getUserPhoto(u.id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    UserPhoto profileImage = snapshot.data;
                    return ClipOval(
                        child: Image.network(
                      profileImage.foto,
                      fit: BoxFit.cover,
                    ));
                  } else if (snapshot.hasError) {
                    return ClipOval(
                        child: Image(
                      image: AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                      fit: BoxFit.contain,
                    ));
                  }
                  return ClipOval(
                      child: Image(
                    image: AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                    fit: BoxFit.contain,
                  ));
                },
              ),
            ),
            Text(
              "${u.nombre} ${u.apellido}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.black87,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return userProfileUser(loggedUser, u, false, true);
                    }));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit_square,
                    color: Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return AdminUserData(loggedUser, u);
                    }));
                  },
                ),
                u.estado == "Activo"
                    ? IconButton(
                        icon: Icon(
                          Icons.lock_outline_sharp,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Se inhabilitará este usuario!",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(226, 144, 32, 1),
                                          fontWeight: FontWeight.w700)),
                                  content: Text(
                                      "¿Está seguro de inhabilitar este usuario?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  backgroundColor: Colors.white70,
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Usuario inhabilitado",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha inhabilitado el usuario",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      User updatedUser = User(
                                                          id: u.id,
                                                          nombre: u.nombre,
                                                          apellido: u.apellido,
                                                          rol: u.rol,
                                                          sexo: u.sexo,
                                                          fechaNacimiento:
                                                              u.fechaNacimiento,
                                                          telefono: u.telefono,
                                                          descripcionPersonal: u
                                                              .descripcionPersonal,
                                                          estado: "Inactivo",
                                                          usuario: u.usuario,
                                                          password: u.password,
                                                          confirmPassword:
                                                              u.confirmPassword,
                                                          v: u.v);
                                                      editUser(updatedUser);
                                                      Timer(
                                                          Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return ExplorePageAdmin(
                                                              loggedUser);
                                                        }));
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                      child: Text(
                                        'Sí',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Se habilitará este usuario!",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(226, 144, 32, 1),
                                          fontWeight: FontWeight.w700)),
                                  content: Text(
                                      "¿Está seguro de habilitar este usuario?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                  backgroundColor: Colors.white70,
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Usuario habilitado",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1),
                                                        fontWeight:
                                                            FontWeight.w700)),
                                                content: Text(
                                                    "Se ha habilitado el usuario",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 18)),
                                                backgroundColor: Colors.white70,
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      User updatedUser = User(
                                                          id: u.id,
                                                          nombre: u.nombre,
                                                          apellido: u.apellido,
                                                          rol: u.rol,
                                                          sexo: u.sexo,
                                                          fechaNacimiento:
                                                              u.fechaNacimiento,
                                                          telefono: u.telefono,
                                                          descripcionPersonal: u
                                                              .descripcionPersonal,
                                                          estado: "Activo",
                                                          usuario: u.usuario,
                                                          password: u.password,
                                                          confirmPassword:
                                                              u.confirmPassword,
                                                          v: u.v);
                                                      editUser(updatedUser);
                                                      Timer(
                                                          Duration(seconds: 2),
                                                          () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute<
                                                                    void>(
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                          return ExplorePageAdmin(
                                                              loggedUser);
                                                        }));
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white70),
                                                    child: Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                      child: Text(
                                        'Sí',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white70),
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
              ],
            ),
          ],
        ),
      ));
    }
  }
  return uRet;
}

List<Widget> Companies(List<Company>? companies, User loggedUser, context) {
  List<Widget> cRet = [];
  for (Company c in companies!) {
    cRet.add(Padding(padding: EdgeInsets.all(8)));
    cRet.add(Container(
      width: MediaQuery.of(context).size.height * 0.33,
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: c.estado == "Activo" ? Colors.white : Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color.fromRGBO(1, 167, 211, 1), width: 4.0),
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 4.0)),
            width: 100,
            height: 100,
            child: FutureBuilder(
              future: getCompanyPhoto(c.id),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  UserPhoto profileImage = snapshot.data;
                  return ClipOval(
                      child: Image.network(
                    profileImage.foto,
                    fit: BoxFit.cover,
                  ));
                } else if (snapshot.hasError) {
                  return ClipOval(
                      child: Image(
                    image: AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                    fit: BoxFit.contain,
                  ));
                }
                return ClipOval(
                    child: Image(
                  image: AssetImage('assets/img/ImagenUsuarioDefecto.jpg'),
                  fit: BoxFit.contain,
                ));
              },
            ),
          ),
          Text(
            c.nombreEmpresa,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.black87,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return CompanyProfileAdmin(loggedUser, c, false);
                  }));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.edit_square,
                  color: Colors.black54,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return EditCompanyAdmin(loggedUser, c);
                  }));
                },
              ),
              c.estado == "Activo"
                  ? IconButton(
                      icon: Icon(
                        Icons.lock_outline_sharp,
                        color: Colors.red,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Se inhabilitará esta empresa!",
                                    style: TextStyle(
                                        color: Color.fromRGBO(226, 144, 32, 1),
                                        fontWeight: FontWeight.w700)),
                                content: Text(
                                    "¿Está seguro de inhabilitar esta empresa?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                backgroundColor: Colors.white70,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Empresa inhabilitada",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          226, 144, 32, 1),
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              content: Text(
                                                  "Se ha inhabilitado la empresa",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                              backgroundColor: Colors.white70,
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Company updatedCompany =
                                                        Company(
                                                            id: c.id,
                                                            nombreEmpresa:
                                                                c.nombreEmpresa,
                                                            correo: c.correo,
                                                            direccion:
                                                                c.direccion,
                                                            telefono:
                                                                c.telefono,
                                                            descripcion:
                                                                c.descripcion,
                                                            valores: c.valores,
                                                            rol: c.rol,
                                                            estado: "Inactivo",
                                                            usuario: c.usuario,
                                                            password:
                                                                c.password,
                                                            confirmPassword: c
                                                                .confirmPassword,
                                                            v: c.v);
                                                    editCompany(updatedCompany);
                                                    Timer(Duration(seconds: 2),
                                                        () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  void>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return ExplorePageAdmin(
                                                            loggedUser);
                                                      }));
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white70),
                                                  child: Text(
                                                    'Aceptar',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            1, 167, 211, 1),
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white70),
                                    child: Text(
                                      'Sí',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 167, 211, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white70),
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 167, 211, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Se habilitará esta empresa!",
                                    style: TextStyle(
                                        color: Color.fromRGBO(226, 144, 32, 1),
                                        fontWeight: FontWeight.w700)),
                                content: Text(
                                    "¿Está seguro de habilitar esta empresa?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                backgroundColor: Colors.white70,
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Empresa habilitada",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          226, 144, 32, 1),
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              content: Text(
                                                  "Se ha habilitado la empresa",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18)),
                                              backgroundColor: Colors.white70,
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Company updatedCompany =
                                                        Company(
                                                            id: c.id,
                                                            nombreEmpresa:
                                                                c.nombreEmpresa,
                                                            correo: c.correo,
                                                            direccion:
                                                                c.direccion,
                                                            telefono:
                                                                c.telefono,
                                                            descripcion:
                                                                c.descripcion,
                                                            valores: c.valores,
                                                            rol: c.rol,
                                                            estado: "Activo",
                                                            usuario: c.usuario,
                                                            password:
                                                                c.password,
                                                            confirmPassword: c
                                                                .confirmPassword,
                                                            v: c.v);
                                                    editCompany(updatedCompany);
                                                    Timer(Duration(seconds: 2),
                                                        () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute<
                                                                  void>(
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                        return ExplorePageAdmin(
                                                            loggedUser);
                                                      }));
                                                    });
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white70),
                                                  child: Text(
                                                    'Aceptar',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            1, 167, 211, 1),
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white70),
                                    child: Text(
                                      'Sí',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 167, 211, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white70),
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 167, 211, 1),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
            ],
          ),
        ],
      ),
    ));
  }
  return cRet;
}
