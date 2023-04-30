import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/users_list/models/user_list_model.dart';
import 'package:provider/provider.dart';
import '../view_models/users_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserViewModel usersviewmodel = context.watch<UserViewModel>();
    print(usersviewmodel.userListModel.length);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Provider with MVVM'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _ui(usersviewmodel)
          ],
        ),
      ),
    );
  }
  _ui(UserViewModel usersviewmodel){
if(usersviewmodel.loading){
  return Container(
    child: Text('loading'),
  );
}
if(usersviewmodel.userError != null){
  return Container(
    child: Text('error'),
  );
}
return Expanded(child: ListView.separated(
    itemBuilder: (context,index){
      UserModel userModel = usersviewmodel.userListModel[index];
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Text(userModel.name! , style: TextStyle(color: Colors.black),),
          Text(userModel.email!,  style: TextStyle(color: Colors.black),),


        ],),
      );
    },
    separatorBuilder: (context,index)=>Divider(),
    itemCount: usersviewmodel.userListModel.length));

  }
}
