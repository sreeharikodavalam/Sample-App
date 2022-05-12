import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moovebe/api/api_helper.dart';
import 'package:moovebe/api/models/DataAuth.dart';

class ApiAuth {
  static Future<bool> login({required String password, required String username}) async {
    var response = await http.post(
      ApiHelper.getUri(subUrl: "LoginApi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'password': password,
        'username': username,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      DataAuth dataAuth = DataAuth.fromJson(data);
      if (dataAuth.status ?? false) {
        await ApiHelper.setToken(accessToken: dataAuth.access!, refreshToken: dataAuth.refresh!);
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to create new request . code = ' + response.statusCode.toString());
    }
  }

  static Future<bool> refreshToken() async {
    String refreshToken = await ApiHelper.getRefreshToken();
    print("refreshToken "+refreshToken);
    var response = await http.post(
      ApiHelper.getUri(subUrl: "api/token/refresh/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'refresh': refreshToken,
      }),
    );
    print("response " + response.body);
    Map<String, dynamic> data = jsonDecode(response.body);
    if(!data.containsKey("refresh") || !data.containsKey("token")){
      return false;
    }
    DataTokenRefresh dataAuth = DataTokenRefresh.fromJson(data);
    if (dataAuth.refresh != null && dataAuth.access != null) {
      await ApiHelper.setToken(accessToken: dataAuth.access!, refreshToken: dataAuth.refresh!);
      return true;
    } else {
      return false;
    }
  }
}
