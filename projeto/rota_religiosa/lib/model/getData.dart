// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';

sendDataToAPI({required data}) async {
  final apiUrl =
      Uri.parse('https://api-cirio-2023.nova-work.cloud/api/upload-dados');
  try {
    final response = await http.post(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        // Adicione os cabeçalhos CORS aqui para permitir a origem do seu aplicativo Flutter
        "Access-Control-Allow-Origin": "*", // Substitua pelo domínio permitido
        "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
        "Access-Control-Allow-Headers": "Origin, Content-Type, X-Auth-Token",
      },
      body: jsonEncode({'data': data}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
