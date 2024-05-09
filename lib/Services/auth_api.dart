
import 'dart:convert';
import 'package:find_me/Models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthCallAPi {

  Future<void> login() async {
  final url = 'http://192.168.1.15:5000/auth/login'; // Replace 'your_api_url' with the actual URL of your API
  final body = jsonEncode({
    'email': 'abderrahmen.attia08@gmail.com', // Replace with the actual email
    'password': 'abdou123', // Replace with the actual password
  });

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: body,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    // Process the response data
    final token = data['token'];
    final information = data['information'];
    print("token: ${token}");
    print("information: ${information}");
     // Save token and information in SharedPreferences
    /*final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('information', jsonEncode(information));*/
    // ...
  } else {
    // Handle error response
    final errorMessage = jsonDecode(response.body)['message'];
    print('Login failed: $errorMessage');
  }
}

Future<UserModel> getUserById( String identifier) async {
    UserModel user ;
    try{
       String url = "http://192.168.1.15:5000/auth/getUser/${identifier}";
       final http.Response resp= await http.get(Uri.parse(url),
       headers: <String, String> {'Content-Type': 'application/json; charset=UTF-8'},
       );
       if(resp.statusCode == 200){
        dynamic jsonResponse = json.decode(resp.body);
        user = UserModel.fromJson(jsonResponse);
        print("succes getUserById");
        return user;
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
}