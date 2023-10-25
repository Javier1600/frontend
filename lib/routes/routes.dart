import 'package:flutter/material.dart';
import 'package:frontend/pages/pages.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => const initialPage(),
  };
}
