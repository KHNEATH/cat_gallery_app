import 'package:cat_app/async_module.dart/fakeproduct_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<FakeProductModel>> readAPI() async {
    String url = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(url));
    return compute(fakeProductModelFromJson, response.body);
  }
}
