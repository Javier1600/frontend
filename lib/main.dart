import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const LoginPage());
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'PlaypenSans'),
        title: 'Empleos Chavezpamba',
        initialRoute: 'start',
        routes: Routes.routes,
      ),
    );
  }
}
