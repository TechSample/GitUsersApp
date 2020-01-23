import 'dart:async';
import 'dart:convert';
import 'package:flutter_users/model/UserModel.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:flutter/foundation.dart';

class UserApiProvider {

 Client client = Client();

  Future<List<UserModel>> fetchUsers() async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/users');
  return compute(parseUserList, response.body);
}

}
List<UserModel> parseUserList(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
}