import 'package:scoped_model/scoped_model.dart';
import 'package:wanandroid_flutter/base/global_bloc_state.dart';
import 'package:wanandroid_flutter/model/UserLocation.dart';
import 'package:wanandroid_flutter/utils/sp_utils.dart';

class LoginScopedModel extends Model {
  UserLocation _login;

  get login => _login;

  void setLogin(UserLocation value) {
    _login = value;
  }

  void changeLogin(String name, String cookie) async {
    if (name != null && cookie != null) {
      _login = UserLocation(name, cookie);
      SpUtils.saveUserInfo(name, cookie);
      GlobalBlocState.instance.setGlobal_ul(_login);
    } else {
      _login = null;
      SpUtils.clearUserInfo();
      GlobalBlocState.instance.setGlobal_ul(null);
    }
    notifyListeners();
  }

  void outLogin() {
    _login = null;
    SpUtils.clearUserInfo();
    notifyListeners();
  }
}
