// ignore_for_file: file_names, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, avoid_print, prefer_void_to_null, non_constant_identifier_names, sort_child_properties_last

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/classes/companies.dart';

import 'package:frontend/pages/homePageUser.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/services/company.services.dart';
import 'package:frontend/services/user.services.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  //Controladores de textos:
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //Variables para los valores de los textos:
  String username = '';
  String password = '';
  //Variable para el control de la contra
  bool passwordVisible = true;
  //Variable para validar la existencia del usuario que se logea
  bool uExist = false;
  //variable que contiene todos los usuarios de la base
  late Future<List<User>> users;
  late List<User>? uList = [];
  //variable que contiene todos las companias de la base
  late Future<List<Company>> companies;
  late List<Company>? cList = [];
  //Usuario que se loguea
  User authUser = User(
      id: "",
      nombre: "",
      apellido: "",
      rol: "",
      sexo: "",
      fechaNacimiento: DateTime.now(),
      telefono: "",
      usuario: "",
      password: "",
      confirmPassword: "",
      v: 0);
  //Empresa que se loguea
  Company authCompany = Company(
      id: "",
      nombreEmpresa: "",
      correo: "",
      direccion: "",
      telefono: "",
      descripcion: "",
      rol: "",
      usuario: "",
      password: "",
      confirmPassword: "",
      v: 0);
  //Variable para controlar si se loguea una empresa
  bool isCompany = false;
  @override
  void initState() {
    users = getAllUsers();
    companies = getAllCompanies();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    usernameController.clear();
    passwordController.clear();
    username = '';
    password = '';
  }

  void loginAlert(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,
              style: TextStyle(
                  color: Color.fromRGBO(226, 144, 32, 1),
                  fontWeight: FontWeight.w700)),
          content: Text(msg,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.white70,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cerrar',
                style: TextStyle(
                    color: Color.fromRGBO(1, 167, 211, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          foregroundColor: Color.fromRGBO(1, 167, 211, 1),
          leading: IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          title: Text(
            "Inicio de Sesión",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
                color: Color.fromRGBO(226, 144, 32, 1)),
            textAlign: TextAlign.center,
          ),
        ),
        body: FutureBuilder(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                uList = snapshot.data;
                return FutureBuilder(
                  future: companies,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      cList = snapshot.data;
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20),
                            ),
                            Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Empleos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 40.0,
                                          color:
                                              Color.fromRGBO(1, 167, 211, 1)),
                                      textAlign: TextAlign.center,
                                    ),
                                    RichText(
                                        text: const TextSpan(children: [
                                      TextSpan(
                                        text: "Chavez",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 40.0,
                                            color:
                                                Color.fromRGBO(226, 144, 32, 1),
                                            fontFamily: 'PlaypenSans'),
                                      ),
                                      TextSpan(
                                        text: "pamba",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 40.0,
                                            color:
                                                Color.fromRGBO(1, 167, 211, 1),
                                            fontFamily: 'PlaypenSans'),
                                      ),
                                    ])),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 10)),
                                    ClipOval(
                                      child: Image(
                                        image: AssetImage("assets/img/cp.png"),
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 15)),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0, 15.0),
                                                blurRadius: 15.0)
                                          ]),
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "Ingresa tu usuario y contraseña:",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17.0,
                                                color: Color.fromRGBO(
                                                    226, 144, 32, 1),
                                                fontFamily: 'PlaypenSans'),
                                          ),
                                          Divider(
                                            color:
                                                Color.fromRGBO(226, 144, 32, 1),
                                          ),
                                          Text(
                                            'Usuario',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1)),
                                          ),
                                          TextField(
                                            controller: usernameController,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.account_circle),
                                              hintText: 'Usuario',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            onChanged: (valor) => setState(() {
                                              username = valor;
                                            }),
                                          ),
                                          Text(
                                            'Contraseña',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    1, 167, 211, 1)),
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: passwordController,
                                            obscureText: passwordVisible,
                                            decoration: InputDecoration(
                                              icon: Icon(Icons.password),
                                              hintText: 'Contraseña',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              suffixIcon: IconButton(
                                                icon: Icon(passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    passwordVisible =
                                                        !passwordVisible;
                                                  });
                                                },
                                              ),
                                            ),
                                            onChanged: (valor) => setState(() {
                                              password = valor;
                                            }),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Checkbox(
                                                  activeColor: Color.fromRGBO(
                                                      226, 144, 32, 1),
                                                  value: isCompany,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      isCompany = !isCompany;
                                                    });
                                                  },
                                                ),
                                                Text("Soy una empresa",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 17.0,
                                                        color: Color.fromRGBO(
                                                            226, 144, 32, 1)))
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                //Valido que se haya ingresado valores a los textos
                                                if (username.isEmpty ||
                                                    password.isEmpty) {
                                                  loginAlert("Error",
                                                      "Ingrese los campos requeridos");
                                                } else {
                                                  //Valido el valor del ChekBox
                                                  //Inicia sesion como empresa
                                                  if (isCompany) {
                                                    int i = 0;
                                                    while (uExist == false &&
                                                        i < cList!.length) {
                                                      if (cList![i].usuario ==
                                                              username &&
                                                          cList![i].password ==
                                                              md5
                                                                  .convert(utf8
                                                                      .encode(
                                                                          password))
                                                                  .toString()) {
                                                        authCompany = cList![i];
                                                        uExist = true;
                                                        if (uExist) {
                                                          clearTextFields();
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute<
                                                                      Null>(
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                            return homePageUser(
                                                                authUser);
                                                          }));
                                                          break;
                                                        }
                                                      } else {
                                                        uExist = false;
                                                        i = i + 1;
                                                      }
                                                    }
                                                    if (uExist == false) {
                                                      //No existe la empresa
                                                      loginAlert("Error",
                                                          "Verifique las credenciales ingresadas");
                                                    }
                                                    uExist = false;
                                                  } else {
                                                    //No es empresa
                                                    //Busco el usuario en la lista de usuarios
                                                    int i = 0;
                                                    while (uExist == false &&
                                                        i < uList!.length) {
                                                      if (uList![i].usuario ==
                                                              username &&
                                                          uList![i].password ==
                                                              md5
                                                                  .convert(utf8
                                                                      .encode(
                                                                          password))
                                                                  .toString()) {
                                                        authUser = uList![i];
                                                        uExist = true;
                                                        //Verifico la existencia del usuario
                                                        if (uExist) {
                                                          //Existe y es un Cliente
                                                          if (authUser.rol ==
                                                              "Cliente") {
                                                            clearTextFields();
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute<
                                                                        Null>(
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                              return homePageUser(
                                                                  authUser);
                                                            }));
                                                          } else {
                                                            //Existe y es un Administrador
                                                            clearTextFields();
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute<
                                                                        Null>(
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                              return homePageUser(
                                                                  authUser);
                                                            }));
                                                            break;
                                                          }
                                                        }
                                                      } else {
                                                        uExist = false;
                                                        i++;
                                                      }
                                                    }
                                                    if (uExist == false) {
                                                      //No existe la empresa
                                                      loginAlert("Error",
                                                          "Verifique las credenciales ingresadas");
                                                    }
                                                    uExist = false;
                                                  }
                                                }
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.white),
                                              child: Text(
                                                "Ingresar",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        1, 167, 211, 1),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color:
                                                Color.fromRGBO(226, 144, 32, 1),
                                          ),
                                          Text(
                                            "Registrarme como:",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    226, 144, 32, 1),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    clearTextFields();
                                                    Navigator.pushNamed(
                                                        context, 'userSignIn');
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white),
                                                  child: Text(
                                                    "Usuario",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            1, 167, 211, 1),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      clearTextFields();
                                                      Navigator.pushNamed(
                                                          context,
                                                          'companySignIn');
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white),
                                                    child: Text(
                                                      "Empresa",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              1, 167, 211, 1),
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                    CircularProgressIndicator(
                      color: Color.fromRGBO(1, 167, 211, 1),
                    ),
                  ],
                ),
              );
            }));
  }
}
