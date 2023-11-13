// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/pages/loginUser.dart';

class initialPage extends StatefulWidget {
  const initialPage({super.key});

  @override
  State<initialPage> createState() => _initialPageState();
}

class _initialPageState extends State<initialPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const loginPage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(206, 144, 32, 1),
          Colors.white,
          Color.fromRGBO(1, 167, 211, 1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image(
                image: AssetImage("assets/img/cp.png"),
                width: 150,
                height: 150,
              ),
            ),
            Text(
              "Empleos",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                  color: Colors.black,
                  fontFamily: 'PlaypenSans'),
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: "Chavez",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40.0,
                    color: Colors.black,
                    fontFamily: 'PlaypenSans'),
              ),
              TextSpan(
                text: "pamba",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 40.0,
                    color: Colors.black,
                    fontFamily: 'PlaypenSans'),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
