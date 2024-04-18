import 'dart:convert';
import 'package:http/http.dart' as https;

import 'api_uri.dart';

Map<String, String> jsonHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


Future<Map<String, dynamic>> postRequest(String path, String body) async {
  Map<String, dynamic> result = {};

  try {

    final response = await https.post(
      Uri.http(domain, path),
      headers: jsonHeader,
      body: body,
    );

    // Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {

      result = {
        'status': true,
        'message': 'Request successful.'
      };

    } 
    
    else {

      result = {
        'status': false,
        'message': 'Error occurred'
      };

    }

  } 
  
  catch (e) {
    print(e);
    result = {
      'status': false,
      'message': 'Error occurred'
    };
  }
  print (result);
  return result;
}

// Use empty map for no query parameters
Future<Map<String, dynamic>> getMapRequest (String path, Map<String, dynamic> queryParams) async {

  try {

    final uri = queryParams != {} ? Uri.http(domain, path, queryParams) : Uri.http(domain, path);

    final response = await https.get(
      uri,
      headers: jsonHeader,
    );

    if (response.statusCode == 200) {
      
      if (response.body.isEmpty) return {};

      final responseData = jsonDecode(response.body);
      return Map<String, dynamic>.from(responseData);
    } 
    
    else {
      return {};
    }
  } 
  
  catch (e) {
    return {};
  }

}


Future<List<Map<String, dynamic>>> getListRequest (String path, Map<String, dynamic> queryParams) async {

  try {

    final uri = queryParams != {} ? Uri.http(domain, path, queryParams) : Uri.http(domain, path);

    final response = await https.get(
      uri,
      headers: jsonHeader,
    );

    if (response.statusCode == 200) {
      
      if (response.body.isEmpty) return [];

      final responseData = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(responseData);
    } 
    
    else {
      return [];
    }
  } 
  
  catch (e) {
    return [];
  }

}


Future<Map<String, dynamic>> update(String path, String body) async {

  Map<String, dynamic> result = {};

  try {
    final response = await https.patch(
      Uri.http(domain, path),
      headers: jsonHeader,
      body: body,
    );

    // Map<String, dynamic> responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {

      result = {
        'status': true,
        'message': 'Request successful.',
      };
    } 
    
    else {

      result = {
        'status': false,
        'message': 'An error occurred.',
      };

    }

  }
  
  catch (e) {
    
    result = {
      'status': false,
      'message': 'An error occurred. Please try again.'
    };

  }

  return result;
}