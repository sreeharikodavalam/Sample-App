
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  static const String BASE_URL = "http://flutter.noviindus.co.in/api/";
  static const ACCESS_TOKEN = "auth_token";
  static const REFRESH_TOKEN = "refresh_token";

  static Uri getUri({required String subUrl}){
    return Uri.parse(BASE_URL + subUrl);
  }

  static  Future<String> getAccessToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token =  preferences.getString(ACCESS_TOKEN);
    return token ?? "";
  }

  static  Future<String> getRefreshToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token =  preferences.getString(ACCESS_TOKEN);
    return token ?? "";
  }

  static  Future<void> setToken({required String accessToken, required refreshToken}) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(REFRESH_TOKEN,refreshToken);
    preferences.setString(ACCESS_TOKEN,accessToken);
  }

}
//
// {
// "status": true,
// "name": "admin_user",
// "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY2MDAyMTAzNiwiaWF0IjoxNjUyMjQ1MDM2LCJqdGkiOiJmMWRkM2ZmYjMyY2I0MmMwYjM5YTU3NjcxOTBiYmUzMSIsInVzZXJfaWQiOjIsImZpcnN0X25hbWUiOiJhZG1pbl91c2VyIiwidXJsX2lkIjoiVE5UMUg4TyJ9.D144_L3pFh_7vemKQdNAOe-mt-1jQxZhJOnAJMX-1-I",
// "access": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUyMzMxNDM2LCJpYXQiOjE2NTIyNDUwMzYsImp0aSI6ImRjMWI5NWU4MjliZTQ0ZjJiYTY3NDMxMmEyMmYxOTFlIiwidXNlcl9pZCI6MiwiZmlyc3RfbmFtZSI6ImFkbWluX3VzZXIiLCJ1cmxfaWQiOiJUTlQxSDhPIn0.2y1nTWxZ-MNrpPZqktO9XXbhmscPFXpajK0fd4xdxbk",
// "message": "successfully logged In !!",
// "url_id": "TNT1H8O"
// }