import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cat_app/models/cat_model.dart';

class CatApiService {
  static const String _baseUrl = 'https://api.thecatapi.com/v1/images/search';
  static const String _apiKey = 'live_QeYaqE4mf0z0RAJSVWyB9MCFHIH85uLqZXK9T5vtcEldODbeuSzldPtQqR6WmXrd';

  // Fetch a list of cat images with a limit
  Future<List<CatModel>> fetchCatImages({int limit = 10}) async {
    final url = Uri.parse('$_baseUrl?limit=$limit');
    final response = await http.get(
      url,
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      return catModelFromJson(response.body);
    } else {
      print('Error fetching cat images: ${response.body}'); // Log the error response
      throw Exception('Failed to load cat images');
    }
  }

  // Search for cat images based on a query
  Future<List<CatModel>> searchCatImages(String query) async {
    final url = Uri.parse('$_baseUrl?limit=10'); // Adjust the query parameter as needed
     if (kDebugMode) {
         print(url);
       }
    final response = await http.get(
      url,
      headers: {'x-api-key': _apiKey},
    );

    if (response.statusCode == 200) {
      return catModelFromJson(response.body);
    } else {
      print('Error searching cat images: ${response.body}'); // Log the error response
      throw Exception('Failed to search cat images');
    }
  }
}