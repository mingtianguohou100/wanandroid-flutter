import 'dart:ui';

import 'package:flutter/cupertino.dart';

class WanAndroidLocalizations {
  Locale locale;

  WanAndroidLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'home': 'play Android',
      'knowledge': 'knowledge structure',
      'home_bottom_men_btn': 'home',
      'knowledge_bottom_men_btn': 'knowledge structure',
      'my_likes': 'my likes',
      'switch_theme': 'switch theme',
      'switch_language': 'switch language',
      'about_author': 'about',
      'click_login': 'click login',
      'out_login': 'logout',
      'deep_orange': 'deepOrange',
      'brown': 'brown',
      'blue': 'blue',
      'teal': 'teal',
      'amber': 'amber',
      'blue_grey': 'blueGrey',
      'pink': 'pink',
      'click': 'ok',
      'cancel': 'cancel',
      'isLoginOut': 'Are you sure you want to log out?',
      'login': 'login',
      'register': 'register',
      'checkinput': 'check input!',
      'register_ok': 'register ok!',
      'input_content_count':
          'Please enter the user name in the correct format!',
      'input_content_pwd': 'Please enter the password in the correct format!',
      'inputPassWord': 'input paassword',
      'inputAccount': 'input account',
      'account': 'account',
      'password': 'password',
      'read': 'read',
      'submission': 'submission',
      'switch_rxdart': 'rxDart example',
      'often_ui_widget': 'oftenUiWidget',
      'form_option': 'inputWidget',
      'dialog_widget': 'dialogWidget',
      'select_widget': 'selectWidget',
      'progress_widget': 'progressWidget',
      'net_work_select_widget': 'loading...',
      'click_load_more': 'ClickMore',
      'layout_example': 'layout_widget',
      'route_widget': 'route',
    },
    'zh': {
      'home': '玩Android',
      'knowledge': '知识体系',
      'home_bottom_men_btn': '首页',
      'knowledge_bottom_men_btn': '知识体系',
      'my_likes': '我喜欢的',
      'switch_theme': '切换主题',
      'switch_language': '切换语言',
      'about_author': '关于',
      'click_login': '点击登录',
      'out_login': '退出登录',
      'deep_orange': '橘黄色',
      'brown': '棕色',
      'blue': '蓝色',
      'teal': '绿色',
      'amber': '琥珀黄',
      'blue_grey': '蓝灰色',
      'pink': '少女粉',
      'click': '确定',
      'cancel': '取消',
      'isLoginOut': '确定要退出登录吗?',
      'login': '登录',
      'register': '注册',
      'register_ok': '注册成功',
      'checkinput': '请检查输入内容!',
      'input_content_count': '请输入正确格式的用户名!',
      'input_content_pwd': '请输入正确格式的密码!',
      'inputPassWord': '输入密码',
      'inputAccount': '输入用户名',
      'account': '用户名',
      'password': '密码',
      'read': '红色',
      'submission': '提交',
      'switch_rxdart': 'RxDart的使用',
      'often_ui_widget': '常用UI控件',
      'form_option': '输入控件',
      'select_widget': '选项控件',
      'progress_widget': '进度控件',
      'dialog_widget': '弹框控件',
      'net_work_select_widget': '加载中...',
      'click_load_more': '点击加载更多',
      'layout_example': '布局控件',
      'route_widget': '路由',
    }
  };

  get layout_example{
    return _localizedValues[locale.languageCode]['layout_example'];
  }

  get route_widget{
    return _localizedValues[locale.languageCode]['route_widget'];
  }


  get progress_widget {
    return _localizedValues[locale.languageCode]['progress_widget'];
  }


  get dialog_widget {
    return _localizedValues[locale.languageCode]['dialog_widget'];
  }

  get click_load_more {
    return _localizedValues[locale.languageCode]['click_load_more'];
  }

  get net_work_loading {
    return _localizedValues[locale.languageCode]['net_work_select_widget'];
  }

  get form_option {
    return _localizedValues[locale.languageCode]['form_option'];
  }

  get select_widget {
    return _localizedValues[locale.languageCode]['select_widget'];
  }

  get oftenUiWidget {
    return _localizedValues[locale.languageCode]['often_ui_widget'];
  }

  get homeTitle {
    return _localizedValues[locale.languageCode]['home'];
  }

  get knowledgeTitle {
    return _localizedValues[locale.languageCode]['knowledge'];
  }

  get hbmb {
    return _localizedValues[locale.languageCode]['home_bottom_men_btn'];
  }

  get kbmb {
    return _localizedValues[locale.languageCode]['knowledge_bottom_men_btn'];
  }

  /*
  * 侧滑菜单栏
  * **/
//我喜欢的
  get my_likes {
    return _localizedValues[locale.languageCode]['my_likes'];
  }

//切换主题
  get switch_theme {
    return _localizedValues[locale.languageCode]['switch_theme'];
  }

  //切换语言
  get switch_language {
    return _localizedValues[locale.languageCode]['switch_language'];
  }

  //rxDartDemo
  get switch_rxdart {
    return _localizedValues[locale.languageCode]['switch_rxdart'];
  }

  //关于我们
  get about_author {
    return _localizedValues[locale.languageCode]['about_author'];
  }

  /*
  * 退出登录
  * **/
  //退出登录
  get out_login {
    return _localizedValues[locale.languageCode]['out_login'];
  }

  //确定
  get click {
    return _localizedValues[locale.languageCode]['click'];
  }

  get checkinput {
    return _localizedValues[locale.languageCode]['checkinput'];
  }

  get account {
    return _localizedValues[locale.languageCode]['account'];
  }

  get password {
    return _localizedValues[locale.languageCode]['password'];
  }

  //取消
  get cancel {
    return _localizedValues[locale.languageCode]['cancel'];
  }

  //确认退出吗
  get isLoginOut {
    return _localizedValues[locale.languageCode]['isLoginOut'];
  }

//点击登录
  get click_login {
    return _localizedValues[locale.languageCode]['click_login'];
  }

  /*
  * 登录
  * **/
  //登录
  get login {
    return _localizedValues[locale.languageCode]['login'];
  }

  /*
  * 注册
  * **/
  get register {
    return _localizedValues[locale.languageCode]['register'];
  }

  get submission {
    return _localizedValues[locale.languageCode]['submission'];
  }

  get register_ok {
    return _localizedValues[locale.languageCode]['register_ok'];
  }

  get inputAccount {
    return _localizedValues[locale.languageCode]['inputAccount'];
  }

  get inputPassWord {
    return _localizedValues[locale.languageCode]['inputPassWord'];
  }

  get input_content_count {
    return _localizedValues[locale.languageCode]['input_content_count'];
  }

  get input_content_pwd {
    return _localizedValues[locale.languageCode]['input_content_pwd'];
  }

  /*
  * 主题
  * **/
  //橘红色deepOrange
  get deep_orange {
    return _localizedValues[locale.languageCode]['deep_orange'];
  }

  //棕色brown
  get brown {
    return _localizedValues[locale.languageCode]['brown'];
  }

  //蓝色blue
  get blue {
    return _localizedValues[locale.languageCode]['blue'];
  }

  //绿色teal
  get teal {
    return _localizedValues[locale.languageCode]['teal'];
  }

  //琥珀黄amber
  get amber {
    return _localizedValues[locale.languageCode]['amber'];
  }

  //蓝灰色blue_grey
  get blue_grey {
    return _localizedValues[locale.languageCode]['blue_grey'];
  }

//红色
  get read {
    return _localizedValues[locale.languageCode]['read'];
  }

  //少女粉pink
  get pink {
    return _localizedValues[locale.languageCode]['pink'];
  }

  Map<String, String> setPageLanguage(Locale pLocale) {
    return _localizedValues[pLocale.languageCode];
  }

  static WanAndroidLocalizations of(BuildContext context) {
    return Localizations.of(context, WanAndroidLocalizations);
  }
}
