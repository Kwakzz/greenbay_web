import 'dart:convert';
import 'package:greenbay_web/controllers/methods.dart';


String path = '/api/projects';

Future<Map<String, dynamic>> createProject (
  String title, 
  String description, 
  String deadline,
  String ownerId
) async {
  return postRequest(
    path, 
    jsonEncode({
      'title': title,
      'description': description,
      'deadline': deadline,
      'ownerId': ownerId
    })
  );
}


Future<List<Map<String, dynamic>>> getProjects () async {
  return getListRequest(
    path,
    {}
  );
}

Future<Map<String, dynamic>> getProjectById (String id) async {
  return getMapRequest(
    path,
    {
      'id': id
    }
  );
}

Future<List<Map<String, dynamic>>> getProjectsByOwnerId (String ownerId) async {
  return getListRequest(
    path,
    {
      'ownerId': ownerId
    }

  );
}