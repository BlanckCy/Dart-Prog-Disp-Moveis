import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<String?>> fetchCatImages() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<String?> imageUrls =
            List<String?>.from(data.map((image) => image['url'] as String));

        if (imageUrls.length > 5) {
          imageUrls = imageUrls.sublist(0, 5);
        }

        // print('URLs das Imagens: $imageUrls');
        // return [];
        return imageUrls; 
      } else {
        // print('Falha na solicitação da API');
        return [];
      }
    } catch (e) {
      // print('Erro ao chamar a API: $e');
      return [];
    }
  }
}
