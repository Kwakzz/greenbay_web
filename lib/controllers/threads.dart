import 'dart:convert';
import 'package:greenbay_web/controllers/methods.dart';


String threadsPath = '/api/thread';

Future<Map<String, dynamic>> createThread (
  String title, 
  String description, 
  String authorId
) async {
  return postRequest(
    threadsPath, 
    jsonEncode({
      'title': title,
      'description': description,
      'authorId': authorId
    })
  );
}


Future<List<Map<String, dynamic>>> getThreads () async {
  return getListRequest(
    threadsPath, 
    {}
  );
}

Future<Map<String, dynamic>> getThreadById (String id) async {
  return getMapRequest(
    threadsPath, 
    {
      'id': id
    }
    
  );
}

String commentsPath = '/comments';

Future<Map<String, dynamic>> commentOnThread (
  String threadId, 
  String comment, 
  String authorId
) async {
  return postRequest(
    commentsPath, 
    jsonEncode({
      'threadId': threadId,
      'comment': comment,
      'authorId': authorId
    })
  );
}

Future<List<Map<String, dynamic>>> getCommentsByThreadId (String threadId) async {
  return getListRequest(
    commentsPath, 
    {
      'threadId': threadId
    }
  );
}