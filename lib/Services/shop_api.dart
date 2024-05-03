import 'dart:convert';
import 'package:find_me/Models/shop_model.dart';
import 'package:http/http.dart' as http;

class ShopApiCall {
Future<dynamic> getShopByName(String name) async {
  late ShopModel shop ;
    try{
       String url = "http://192.168.1.15:5000/shops/getShopByName?name=${name}";
       final http.Response resp= await http.get(Uri.parse(url),
       headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8'},
       );
       if(resp.statusCode == 200){
        dynamic jsonResponse = json.decode(resp.body);
        if (jsonResponse is List && jsonResponse.length > 0) {
        shop = ShopModel.fromJson(jsonResponse[0]);
        print("succes getShopByName");
        print(shop.coordinates.latitude);
        return shop;}
       }
       else{
       print("failure: ${resp.statusCode}");
       throw Exception('Failed to get shop: ${resp.statusCode}');
       }
    }catch(error){
      print("$error");
      return null;
    }
}
}