import 'package:http/http.dart' as http;
import 'dart:convert';

sendDataToAPI({required data}) async {
  final apiUrl = Uri.parse(
      'https://api-cirio-2023.nova-work.cloud/api/upload-dados'); // Substitua pelo URL correto da sua API

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
      // Sucesso - você pode processar a resposta aqui
      print('Resposta da API: ${response.body}');
      bool x = true;
      return x;
    } else {
      // Trate possíveis erros de resposta aqui
      print('Erro na solicitação POST: ${response.statusCode}');
      bool x = false;
      return x;
    }
  } catch (e) {
    // Trate erros de exceção aqui
    print('Erro ao fazer a solicitação: $e');
    bool x = false;
    return x;
  }
}
