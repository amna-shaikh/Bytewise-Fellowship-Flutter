import 'dart:io';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/user_list_model.dart';
import 'api_status.dart';
class UserService{
  static Future<Object> getusers () async {

    try{
      var url = Uri.parse(Users_List);
      var response = await http.get(url);
      if(response.statusCode == 200){
        return Success(code: 200 , response: userListModelFromJson(response.body));
      }
      return Failure(code: USER_INVALID_RESPONSE, errorresponse: 'Invalid');
    }on HttpException{
      return Failure(code: NO_INTERNET, errorresponse: 'No internet');
    }on FormatException{
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    }
        catch(e){
          return Failure(code:  UNKNOWN_ERROR, errorresponse: 'Unknown');
        }
  }
}