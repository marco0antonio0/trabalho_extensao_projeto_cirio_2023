import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl() async {
  String numero =
      '984837847'; // numero que ira entrar em contato como suporte tecnico do app
  final Uri url = Uri.parse(
      'https://wa.me/5591${numero}?text=Ola%20estou%20precisando%20de%20ajuda%20com%20o%20aplicativo%20!');
  try {
    if (await canLaunchUrl(url)) {
      print('Após _launchUrl - Could not launch $url');
      await launchUrl();
    } else {
      throw Exception('Could not launch $url');
    }
    // ignore: empty_catches
  } catch (e) {}
}
