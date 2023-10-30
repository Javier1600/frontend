import 'package:flutter/material.dart';
import 'package:frontend/pages/loginCompany.dart';
import 'package:frontend/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => const initialPage(),
    'userSignIn': (_) => const userSignIn(),
    'userLogInPage': (_) => const loginUserPage(),
    'companySignIn': (_) => const companySignIn(),
    'companyLogInPage': (_) => const loginCompanyPage(),
  };
}
