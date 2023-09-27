// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission(context, Function? fn) async {
  final status = await Permission.storage.request();

  if (status.isGranted) {
    // Permissão concedida, você pode acessar o armazenamento.
    fn;
  } else if (status.isDenied) {
    // Permissão negada pelo usuário. Mostrar uma mensagem para orientar o usuário a conceder a permissão.

    // Mostrar um diálogo ou uma mensagem para orientar o usuário.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permissão Necessária'),
          content: const Text(
              'Você precisa conceder a permissão de armazenamento para usar o aplicativo.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo.
                // Solicitar novamente a permissão.
              },
            ),
          ],
        );
      },
    );
  } else if (status.isPermanentlyDenied) {
    // Permissão negada permanentemente. Geralmente, redirecione o usuário para as configurações do aplicativo.

    // Mostrar uma mensagem para redirecionar o usuário para as configurações do aplicativo.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permissão Negada Permanentemente'),
          content: const Text(
              'A permissão de armazenamento foi negada permanentemente. Você pode habilitá-la nas configurações do aplicativo.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ir para Configurações'),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo.
                openAppSettings(); // Redirecionar para as configurações do aplicativo.
              },
            ),
          ],
        );
      },
    );
  }
}
