完整的flutter项目，项目大致包含
1.视频引导页
2.登录注册、退出登录
3.国际化
4.主题更换
5.widget和基本功能使用示例
数据接口来自于开源Api-wanandroid

功能和界面很简单，主要为了体验flutter完整项目开发流程和感受，以及一些主流框架的使用，方便以后不断尝试替换最新框架和主流类库，莫天高楼平地起，一个大型项目有一个完善稳定的框架基础非常重要


## **项目结构**
![在这里插入图片描述](https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/project_structure.png)

 base:存放全局使用的一些数据
localization:国际化模块
 model:网络json模型
net:网络模块
page:页面
  often_ui_example:ui例子页面
 scoped_model:状态管理模块
utils:工具模块
widget:自定义和自己封装的一些widget
 main:程序主入口

**项目中遇到的一些坑和经验:**

1.android端启动会有短暂的白屏，解决办法是在项目的android文件夹中找到如下路径，替换图中标识的图片或颜色值（默认是白色）


![在这里插入图片描述](https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/erro_one.png)
2.因为flutter是树形结构，context上下文使用不当很容易就出现某个控件不显示或者报错，比如下图有三个两个context，这里最好把第二个context改个名，不然很容易就使用错误

![在这里插入图片描述]https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/erro_two.png)
3.还是context，树形结构下的代码默认会使用当前的context，但是有的需求要用到父控件的context,这时可以声明一个全局的Globalkey，在scaffold中通过key来绑定，其他地方可以使用这个key

```
  GlobalKey<ScaffoldState> _global;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _global = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(key:_global );
  }
```
其他的暂时没有想起，等想起了再添加记录吧




## 下面看一下项目截图，跑起来很流畅，完全可以替代原生，实现跨平台项目，近期也是会尝试正式项目中使用flutter

## **启动页**

![在这里插入图片描述](https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/android_start.png)


## **android端主界面**
![在这里插入图片描述](https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/android_img.png)

## **Ios主界面**
![在这里插入图片描述](https://raw.githubusercontent.com/mingtianguohou100/wanandroid-flutter/master/resources/project_resources/ios_img.png)





**说一下个人感受，本人是做android原生开发的，去年九月份开始关注flutter，一直致力于flutter跨平台开发(请叫我移动端开发者,笑~)


1.flutter的代表性就是嵌套布局和万物皆widget,所有界面控件都是widget, 在写代码的时候总有种感觉这里可以封装，那里还可以提升一个全局的widget，总感觉代码可以进一步优化，而且flutter的widget很多，有的地方感觉这个widget可以实现，那个widget也可以使，最后导致不知道怎么实现。


2.flutter属于前端框架，个人感觉它的很多机制和思想一半属于前端一半属于原生移动端，某些东西在我一个做android原生开发的看来着实不好理解，比如状态管理机制，之前也参考了很多github上大佬们的项目，有用redux、bloc等，最后还是选用了scoped_model（感觉离移动端稍近，更好理解），不仅可以状态管理，还可以做到mvp的效果,数据逻辑和视图分离，我感觉最重要的就是flutter里面视图和逻辑代码是在一起的，天生的mvvm（android是Activity里面写代码，xml里面布局）原因。**




csdn博客：[https://blog.csdn.net/mingtianguohou100)




## 这个开源项目会持续更新，界面功能很简单，就是因为后期可以替换和使用一些主流的框架和架构，大家觉得有用多来点start吧，感谢!

