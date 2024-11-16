import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nesa_test/model/products_model.dart';

class ProductsProvider extends ChangeNotifier {
  static final ProductsProvider _singleton = ProductsProvider._internal();

  factory ProductsProvider() {
    return _singleton;
  }

  ProductsProvider._internal();
  ProductsModel? productsModel;

  void updateProducts() async {
    Dio dio = Dio();
    var response = await dio.get("https://dummyjson.com/products");
    productsModel = ProductsModel.fromJson(response.data);
    notifyListeners();
  }
}
