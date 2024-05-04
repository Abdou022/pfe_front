import 'dart:convert';
import 'package:find_me/Models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryApiCall {

  Future<List<CategoryModel>> getAllcategories() async {
    List<CategoryModel> categories = [];
    const String url = "http://192.168.1.15:5000/categories/getAllCategories";
    final http.Response resp = await http.get(Uri.parse(url));
    if(resp.statusCode==200){
      List<dynamic> jsonResponse = json.decode(resp.body);
      categories = jsonResponse.map((item) => CategoryModel.fromJson(item)).toList();
      print("success getAllcategories");
      print(categories);
    }else {
      print("failed: ${resp.statusCode}");
    }
    return categories;
  }

  Future<List<dynamic>> fetchCategoryProducts(String shopId) async {
  final url = 'http://192.168.1.15:5000/categories/getCategoryProducts/$shopId';
  try{
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<dynamic> prods = data['prods'];
    return prods;
  } else {
    throw Exception('Failed to fetch category products');
  }
}catch(error){
    throw Exception('Error: $error');
  }
}
}