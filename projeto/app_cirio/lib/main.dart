import 'package:app_cirio/paginas/pagina_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //==========================================
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //==========================================
  runApp(const MaterialApp(
    home: PaginoHome(),
  ));
}
