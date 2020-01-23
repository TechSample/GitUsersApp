import 'package:flutter_users/model/UserModel.dart';
import 'package:flutter_users/provider/UserApiProvider.dart';

class Repository{

 final usersApiProvider = UserApiProvider();

  Future<List<UserModel>> fetchAllUsers() => usersApiProvider.fetchUsers();

}