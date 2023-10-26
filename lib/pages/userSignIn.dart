// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, sort_child_properties_last
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:frontend/classes/users.dart';

import 'package:frontend/services/user.services.dart';

class userSignIn extends StatefulWidget {
  const userSignIn({super.key});

  @override
  State<userSignIn> createState() => _userSignInState();
}

class _userSignInState extends State<userSignIn> {
  //Variable que contiene todos los usuarios actuales de la base
  late Future<List<User>> users;
  //Variable para iterar la lista de usuarios de la base
  List<User>? uList = [];
  //Variables para los valores de los campos
  String nombre = '';
  String apellido = '';
  String rol = '';
  String sexo = '';
  String fechaNacimiento = '';
  String telefono = '';
  String usuario = '';
  String password = '';
  String confirmPassword = '';
  //Controladores de textos para las contraseñas y la fecha de nacimiento
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  //Variables para controlar los checkboxs de sexo
  bool isMale = false;
  bool isFemale = false;
  //Mascara del campo fecha nacimiento
  var dateMaskFormatter = MaskTextInputFormatter(
      mask: '##-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  //Mascara del campo telefono
  var phoneMaskFormatter = MaskTextInputFormatter(
      mask: '##########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  //Variable para el control de la contra y la confirmacion de contra
  bool passwordVisible = true;
  bool confPassVisible = true;
  @override
  void initState() {
    users = getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              uList = snapshot.data;
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30),
                    ),
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
                          "Registro de nuevo usuario",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              color: Color.fromRGBO(226, 144, 32, 1),
                              fontFamily: 'PlaypenSans'),
                        ),
                      ]),
                    ),
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
                            'Nombre',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Nombre',
                                hintStyle: TextStyle(color: Colors.grey),
                                icon: Icon(Icons.account_circle_outlined)),
                            onChanged: (valor) => setState(() {
                              nombre = valor;
                            }),
                          ),
                          Text(
                            'Apellido',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Apellido',
                              hintStyle: TextStyle(color: Colors.grey),
                              icon: Icon(Icons.account_circle_outlined),
                            ),
                            onChanged: (valor) => setState(() {
                              apellido = valor;
                            }),
                          ),
                          Text(
                            'Sexo',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: isMale,
                                        activeColor:
                                            Color.fromRGBO(226, 144, 32, 1),
                                        onChanged: (newBool) {
                                          setState(() {
                                            isMale = newBool!;
                                            isFemale = !isMale;
                                          });
                                        }),
                                    Text(
                                      "Masculino",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                  value: isFemale,
                                  activeColor: Color.fromRGBO(226, 144, 32, 1),
                                  onChanged: (newBool) {
                                    setState(() {
                                      isFemale = newBool!;
                                      isMale = !isFemale;
                                    });
                                  }),
                              Text(
                                "Femenino",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.0,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          Text(
                            'Fecha de nacimiento',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [dateMaskFormatter],
                            decoration: InputDecoration(
                              hintText: 'MM-DD-AAAA',
                              icon: Icon(Icons.calendar_month_outlined),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              fechaNacimiento = valor;
                            },
                          ),
                          Text(
                            'Número de teléfono',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [phoneMaskFormatter],
                            decoration: InputDecoration(
                              hintText: '0987654321',
                              icon: Icon(Icons.numbers),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              telefono = valor;
                            },
                          ),
                          Text(
                            'Nombre de usuario',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'user123',
                              icon: Icon(Icons.supervisor_account),
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            onChanged: (valor) {
                              usuario = valor;
                            },
                          ),
                          Text(
                            'Contraseña',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passController,
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              icon: Icon(Icons.password),
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
                              password = valor;
                            }),
                          ),
                          Text(
                            'Confirmar contraseña',
                            style: TextStyle(
                                color: Color.fromRGBO(1, 167, 211, 1)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: confirmPassController,
                            obscureText: confPassVisible,
                            decoration: InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: 'Contraseña',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(confPassVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    confPassVisible = !confPassVisible;
                                  });
                                },
                              ),
                            ),
                            onChanged: (valor) => setState(() {
                              confirmPassword = valor;
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Registrar',
                                    style: TextStyle(
                                        color: Color.fromRGBO(1, 167, 211, 1),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Color.fromRGBO(226, 144, 32, 1),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
