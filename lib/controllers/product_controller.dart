import 'package:emart_firebase_app/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = [];
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");

    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    try {
      for (var e in s[0].subcategory) {
        subcat.add(e);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
