import 'package:flutter/material.dart';
import 'package:flutter_users/bloc/UserBloc.dart';
import 'package:flutter_users/model/UserModel.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  void initState() {

    super.initState();
    bloc.fetchAllUsers();
    
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Popular Github Users'),
      ),
      body: StreamBuilder(
        stream: bloc.allUsers,
        builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

   Widget buildList(AsyncSnapshot<List<UserModel>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 10.0,
            margin: EdgeInsets.all(20.0),
            borderOnForeground: false,
            color: Colors.black12,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(snapshot.data[index].id.toString() + "  "+snapshot.data[index].name),
              subtitle: Text(snapshot.data[index].email),
              trailing: Icon(Icons.favorite_border),
            ),
          );
        });
  }


   @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}