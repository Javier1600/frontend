// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class initialPage extends StatefulWidget {
  const initialPage({super.key});

  @override
  State<initialPage> createState() => _initialPageState();
}

class _initialPageState extends State<initialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
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
                            color: Color.fromRGBO(206, 144, 32, 1),
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
                        width: 290,
                        height: 290,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Divider(
                      color: Color.fromRGBO(206, 144, 32, 1),
                    ),
                    Text(
                      "Iniciar sesión como:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(206, 144, 32, 1),
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'userLogInPage');
                              },
                              child: Text(
                                'Usuario',
                                style: TextStyle(
                                    color: Color.fromRGBO(1, 167, 211, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, 'companyLogInPage');
                              },
                              child: Text(
                                'Empresa',
                                style: TextStyle(
                                    color: Color.fromRGBO(1, 167, 211, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white)),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
