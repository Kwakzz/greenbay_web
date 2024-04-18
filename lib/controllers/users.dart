import 'dart:convert';
import 'package:greenbay_web/controllers/methods.dart';


String path = '/api/users';

Future<Map<String, dynamic>> createUser (
  String username, 
  String email, 
  String password,
) async {
  return postRequest(
    path, 
    jsonEncode({
      'username': username,
      'email': email,
      'password': password
    })
  );
}


Future<List<Map<String, dynamic>>> getUsers () async {
  return getListRequest(
    path,
    {}
  );
}

Future<Map<String, dynamic>> getUserById (String id) async {
  return getMapRequest(
    path,
    {
      'id': id
    }
  );
}
