import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:novi/api/api_helper.dart';

class ApiBus {

  static Future<Map<String, dynamic>> assignDriver({required String driverId, required String busId}) async {
    var response = await http.post(
      ApiHelper.getUri(subUrl: "LoginApi"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bus_id': busId,
        'driver_id': driverId,
      }),
    );
    return jsonDecode(response.body);
  }

}