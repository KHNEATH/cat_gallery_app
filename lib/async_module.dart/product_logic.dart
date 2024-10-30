import 'package:flutter/material.dart';
import 'fakeproduct_model.dart';
import 'product_service.dart';

class ProductLogic extends ChangeNotifier {
  List<FakeProductModel> _productList = [];
  List<FakeProductModel> get productList => _productList;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  Future getData() async {
    setLoading();
    try {
      _productList = await ProductService.readAPI();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally{
      _loading = false;
    }
    
    notifyListeners();
  }
}
