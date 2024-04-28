import 'package:find_me/Models/prod_filter.dart';
import 'package:find_me/Models/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductApiCall{

  Future<List<ProductModel>> searchProductsWithFilter( ProductFilter filtre) async{
    List<ProductModel> products = [];
    try{
    const String url = "http://192.168.1.15:5000/products/searchProductsWithFilter";
    final http.Response resp= await http.post(Uri.parse(url),
    headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode(filtre.toJson()));

    if(resp.statusCode==200){
      /*print("name ${filtre.name}");
      
      print("colors ${filtre.colors}");
      print("sortBy ${filtre.sortBy}");
      print("sortOrder ${filtre.sortOrder}");
      print("region ${filtre.region}");
      print("size: ${filtre.size}");*/
      List<dynamic> jsonResponse = json.decode(resp.body);
      products = jsonResponse.map((item) => ProductModel.fromJson(item)).toList();
      print("${products.length} Products recieved");
      print("${resp.body}");
      return products;
    }else {
      print("failed: ${resp.statusCode}");
    }
    } catch(error){
      print("erreur: ${error}");
    }
    return [];
  }
}