import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiNetwork {
  static Future<dynamic> postApi(
      String url, Map<String, dynamic> payload) async {
    try {
      final response =
          await http.post(Uri.parse(url), body: jsonEncode(payload));
      if (response.statusCode == 200) {
        log("post api completed");
      }
      return response;
    } catch (e) {
      throw Exception("Error on network Api $e");
    }
  }

  static Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("get api completed");
      }
      return response.body;
    } catch (e) {
      throw Exception("Error on network Api $e");
    }
  }

  static Future<dynamic> putApi(
      String url, Map<String, dynamic> payload) async {
    try {
      final response =
          await http.put(Uri.parse(url), body: jsonEncode(payload));
      if (response.statusCode == 200) {
        log("put api completed");
      }
      return response;
    } catch (e) {
      throw Exception("Error on network Api $e");
    }
  }
}
