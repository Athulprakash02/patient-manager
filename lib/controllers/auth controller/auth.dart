import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = 'https://flutter-amr.noviindus.in/api/';
class AuthService {
  Future<bool> loginUser(String userName, String password) async {
    try {
      
      String endPoint = 'Login';
      final values = {'username': userName, 'password': password};
      Map<String, String> headers = {'Content-Type': 'application/json'};
      final apiUrl = Uri.parse(baseUrl + endPoint);
      var response=
          await http.post(apiUrl, headers: headers, body: json.encode(values));
      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        var data = response.body;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}