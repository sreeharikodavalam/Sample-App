import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:novi/api/api_helper.dart';

class ApiDriver {

  static Future<Map<String, dynamic>> listDriver({required String password, required String username}) async {
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
    return jsonDecode(response.body);
  }


  static Future<Map<String, dynamic>> addDriver({required String driverName, required String licenceNumber, required String mobileNumber}) async {
    var response = await http.post(
      ApiHelper.getUri(subUrl: "LoginApi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': driverName,
        'mobile': mobileNumber,
        'licence_no': licenceNumber
      }),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> deleteDriver({required String driverId}) async {
    var response = await http.post(
      ApiHelper.getUri(subUrl: "LoginApi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'driver_id': driverId,
      }),
    );
    return jsonDecode(response.body);
  }
}