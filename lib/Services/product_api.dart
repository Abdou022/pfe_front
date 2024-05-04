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
      //print("${products.length} Products recieved");
      //print("${resp.body}");
      return products;
    }else {
      print("failed: ${resp.statusCode}");
    }
    } catch(error){
      print("erreur: ${error}");
    }
    return [];
  }


  Future<ProductModel> getProductById( String identifier) async {
    ProductModel product ;
    try{
       String url = "http://192.168.1.15:5000/products/getProduct/${identifier}";
       final http.Response resp= await http.get(Uri.parse(url),
       headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8'},
       );
       if(resp.statusCode == 200){
        dynamic jsonResponse = json.decode(resp.body);
        product = ProductModel.fromJson(jsonResponse);
        print("succes getProductById");
        return product;
       }
       else{
       print("failure: ${resp.statusCode}");
       }
    }catch(error){
      print("$error");
      throw Exception('Request failed .. $error');
    }
    throw Exception('Request failed.');
  }
  
  Future<ProductModel> getProductByBarCode( String identifier) async {
    ProductModel product ;
    try{
       String url = "http://192.168.1.15:5000/products/getProductByBarCode?barcode=${identifier}";
       final http.Response resp= await http.get(Uri.parse(url),
       headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8'},
       );
       if(resp.statusCode == 200){
        dynamic jsonResponse = json.decode(resp.body);
        if (jsonResponse is List && jsonResponse.length > 0) {
        product = ProductModel.fromJson(jsonResponse[0]);
        print("succes");
        return product;}
       }
       else{
       print("failure: ${resp.statusCode}");
       }
       return ProductModel(id: '', price: -1, name: '', rating: -1, barcode: -1, thumbnail: '', images: [], colors: [], v: -1, brand: '', size: [], shops: [], description: '', category: [], createdAt: DateTime.now(), updatedAt: DateTime.now());
    }catch(error){
      print("$error");
      return ProductModel(id: '', price: -1, name: '', rating: -1, barcode: -1, thumbnail: '', images: [], colors: [], v: -1, brand: '', size: [], shops: [], description: '', category: [], createdAt: DateTime.now(), updatedAt: DateTime.now());
    }
  }

}