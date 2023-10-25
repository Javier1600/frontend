// ignore_for_file: file_names, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, avoid_print, prefer_void_to_null

import 'package:flutter/material.dart';
import 'package:frontend/classes/users.dart';
import 'package:frontend/pages/pages.dart';

import 'package:frontend/services/user.services.dart';

class initialPage extends StatefulWidget {
  const initialPage({super.key});

  @override
  State<initialPage> createState() => _initialPageState();
}

class _initialPageState extends State<initialPage> {
  //Controladores de textos:
  final TextEditingController passwordController = TextEditingController();
  //Variables para los valores de los textos:
  String username = '';
  String password = '';
  //Variable para el control de la contra
  bool passwordVisible = true;
  //variable que contiene todos los usuarios de la base
  late Future<List<User>> users;

  @override
  void initState() {
    users = getAllUsers();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void clearTextFields() {
    passwordController.clear();
  }

  void loginAlert(String title, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(error),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cerrar',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 45),
          child: Center(
            child: Column(
              children: [
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
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ClipOval(
                  child: Image(
                    image: AssetImage("assets/img/cp.png"),
                    width: 120,
                    height: 120,
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 15)),
                Container(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
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
                            color: Color.fromRGBO(226, 144, 32, 1),
                            fontFamily: 'PlaypenSans'),
                      ),
                      Divider(
                        color: Color.fromRGBO(226, 144, 32, 1),
                      ),
                      Text(
                        'Usuario',
                        style: TextStyle(color: Color.fromRGBO(1, 167, 211, 1)),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Usuario',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (valor) => setState(() {
                          username = valor;
                        }),
                      ),
                      Text(
                        'Contraseña',
                        style: TextStyle(color: Color.fromRGBO(1, 167, 211, 1)),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (valor) => setState(() {
                          username = valor;
                        }),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'users');
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              child: Text(
                                "Registrarse",
                                style: TextStyle(
                                    color: Color.fromRGBO(226, 144, 32, 1)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (username.isEmpty ||
                                  passwordController.text.isEmpty) {
                                loginAlert(
                                    "Error", "Ingrese los campos requeridos");
                              } else {
                                Navigator.of(context).push(
                                    MaterialPageRoute<Null>(
                                        builder: (BuildContext context) {
                                  return MyApp("idUsuario");
                                }));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              "Ingresar",
                              style: TextStyle(
                                  color: Color.fromRGBO(1, 167, 211, 1)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
