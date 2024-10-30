import 'package:cat_app/models/cat_model.dart';
import 'package:http/http.dart' as http;

class CatApiService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1/images/search?limit=10';
  static const String _apiKey = 'YOUR_API_KEY'; // Replace with your actual API key

  /// Fetches a list of cat images from the API.
  Future<List<CatModel>> fetchCatImages() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {'x-api-key': _apiKey},
      );

      if (response.statusCode == 200) {
        // Parse and return the list of CatModel objects
        return catModelFromJson(response.body);
      } else {
        throw Exception('Failed to load cat images: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load cat images: $e');
    }
  }
}
