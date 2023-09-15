import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Pagina_principal(),
  ));
}

class Pagina_principal extends StatelessWidget {
  const Pagina_principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [],
      ),
    ));
  }
}
