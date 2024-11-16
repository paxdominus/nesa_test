import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  static final ProductProvider _singleton = ProductProvider._internal();

  factory ProductProvider() {
    return _singleton;
  }

  ProductProvider._internal();

  ProductModel? productModel;

  Future<bool> getProduct(String id) async {
    Dio dio = Dio();
    var response = await dio.get("https://dummyjson.com/products/$id");
    productModel = ProductModel.fromJson(response.data);
    notifyListeners();
    return true;
    // log(productModel?.toJson().toString() ?? "none");
  }

  void editProduct(String id, String title, String desc, String price) async {
    Dio dio = Dio();
    var response = await dio.put("https://dummyjson.com/products/$id",
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: {"title": title, "description": desc, "price": num.parse(price)});
    notifyListeners();
    Fluttertoast.showToast(msg: "success");
  }
}
