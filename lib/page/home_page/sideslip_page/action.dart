import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SideslipAction {
  onLogin,
  onLoginOut,
  onJumpTestOption,
  onChangeLanguage,
  onChangeThemeColor
}

class SideslipActionCreator {
  static Action onLogin() => const Action(SideslipAction.onLogin);

  static Action onLoginOut() => const Action(SideslipAction.onLoginOut);

  static Action onJumpTestOption() =>
      const Action(SideslipAction.onJumpTestOption);

  static Action changeLanguage(String internationalization) =>
      Action(SideslipAction.onChangeLanguage, payload: internationalization);

  static Action changeThemeColor(int position) =>
      Action(SideslipAction.onChangeThemeColor, payload: position);
}
