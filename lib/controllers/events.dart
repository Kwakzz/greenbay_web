import 'dart:convert';
import 'package:greenbay_web/controllers/methods.dart';


String path = '/api/events';

Future<Map<String, dynamic>> createEvent (
  String title, 
  String description, 
  String date,
  String location,
  String organizerId
) async {
  return postRequest(
    path, 
    jsonEncode({
      'title': title,
      'description': description,
      'date': date,
      'location': location,
      'organizerId': organizerId
    })
  );
}


Future<List<Map<String, dynamic>>> getEvents () async {
  return getListRequest(
    path,
    {}
  );
}

Future<Map<String, dynamic>> getEventById (String id) async {
  return getMapRequest(
    path,
    {
      'id': id
    }
  );
}

Future<List<Map<String, dynamic>>> getEventsByOrganizerId (String ownerId) async {
  return getListRequest(
    path,
    {
      'ownerId': ownerId
    }

  );
}