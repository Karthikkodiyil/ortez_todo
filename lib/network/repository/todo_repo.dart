import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ortez_machine_test/model/todo_model.dart';
import 'package:ortez_machine_test/network/api_network.dart';
import 'package:ortez_machine_test/network/app_url.dart';

class TodoRepo {
  static String url = AppUrl.baseUrl;
  static Future<List<TodoModel>> getTodo() async {
    try {
      final result = await ApiNetwork.getApi(url);
      List<dynamic> list = jsonDecode(result) as List<dynamic>;
      return list.map((e) => TodoModel.fromJson(e)).toList();
    } catch (e) {
      log("error on repository $e");
      rethrow;
    }
  }

  static Future<dynamic> putTodo(Map<String, dynamic> payload, int id) async {
    try {
      await ApiNetwork.putApi("$url$id", payload);
    } catch (e) {
      log("error on repository $e");
    }
  }

    static Future<dynamic> postTodo(Map<String, dynamic> payload) async {
    try {
      await ApiNetwork.postApi(url, payload);
    } catch (e) {
      log("error on repository $e");
    }
  }
}
