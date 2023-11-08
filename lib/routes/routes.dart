import 'package:flutter/material.dart';
import 'package:frontend/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'start': (_) => const initialPage(),
    'home': (_) => const loginPage(),
    'userSignIn': (_) => const userSignIn(),
    'companySignIn': (_) => const companySignIn(),
  };
}
