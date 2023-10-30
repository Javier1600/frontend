import 'package:flutter/material.dart';
import 'package:frontend/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => const initialPage(),
    'userSignIn': (_) => const userSignIn(),
    'companySignIn': (_) => const companySignIn(),
    'userLogInPage': (_) => const loginUserPage(),
  };
}
