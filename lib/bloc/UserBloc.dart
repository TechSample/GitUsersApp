
import 'package:flutter_users/model/UserModel.dart';
import 'package:flutter_users/resource/Repository.dart';
import 'package:rxdart/rxdart.dart';


class UserBloc {

  final _repository = Repository();
  final _usersFetcher = PublishSubject<List<UserModel>>();


  Observable<List<UserModel>> get allUsers => _usersFetcher.stream;

  fetchAllUsers() async {
    List<UserModel> itemModel = await _repository.fetchAllUsers();
    _usersFetcher.sink.add(itemModel);
  }

  dispose() {
    _usersFetcher.close();
  }

}

final bloc = UserBloc();
