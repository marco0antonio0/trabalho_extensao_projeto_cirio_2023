import 'package:flutter/material.dart';

// ignore: camel_case_types
class config_rota {
  animacao_1(context, {required Widget novaPagina, mode = true}) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    funcao(context,
        mode: mode,
        novaPagina: novaPagina,
        begin: begin,
        end: end,
        curve: curve);
  }

  animacao_2(context, {required Widget novaPagina, mode = true}) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    funcao(context,
        mode: mode,
        novaPagina: novaPagina,
        begin: begin,
        end: end,
        curve: curve);
  }

  funcao(context,
      {required Widget novaPagina,
      required Offset begin,
      required Offset end,
      mode = true,
      curve}) {
    mode
        ? Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  novaPagina,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              settings: const RouteSettings(name: 'nova_pagina'),
            ),
          )
        : Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  novaPagina,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              settings: const RouteSettings(name: 'nova_pagina'),
            ),
          );
  }
}
