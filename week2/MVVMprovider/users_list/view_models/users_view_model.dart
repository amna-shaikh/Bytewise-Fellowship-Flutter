import 'package:flutter/cupertino.dart';
import 'package:mvvm/users_list/repo/api_status.dart';
import 'package:mvvm/users_list/repo/user_services.dart';
import 'package:mvvm/users_list/view_models/user_error.dart';
import '../models/user_list_model.dart';

class UserViewModel extends ChangeNotifier{
  bool _loading= false;
  List<UserModel> _userListModel = [];
   UserError? _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError =>_userError;

  UsersViewModel(){
    getUsers();
  }
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

setUserListModel(List<UserModel> userListModel){
  _userListModel = userListModel;
}
setUserError(UserError userError){
    _userError = userError;
}
getUsers()async{
    setLoading(true);
    var response = await UserService.getusers();
    if(response is Success){
      setUserListModel(response.response as List<UserModel>);

    }
    if(response is Failure){
     UserError userError = UserError(
       code: response.code,
       message: response.errorresponse
     );
     setUserError(userError);

    }
    setLoading(false);
}
}

