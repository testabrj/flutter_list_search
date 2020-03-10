import 'package:flutter/material.dart';
import 'package:flutter_app_test/helpers/Constants.dart';
import 'package:flutter_app_test/pages/LoginPage.dart';
import 'package:flutter_app_test/pages/UserListPage.dart';
import 'package:flutter_app_test/services/AuthServices.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = LoginPage();
  AuthServices authServices = new AuthServices();



  if(! await authServices.isSessionValid()) {

      _defaultHome = LoginPage();

  } else {
    _defaultHome = UserListPage();
  }

  runApp(ContactApp(defaultHome:_defaultHome));

}


class ContactApp extends StatelessWidget {
  // This widget is the root of your application.


  final Widget defaultHome;

  ContactApp({this.defaultHome});

  final routes = <String,WidgetBuilder>{
    loginPageTag: (context) => LoginPage(),
    userListPageTag: (context) => UserListPage(),
  };




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: appDarkGreyColor,
        primarySwatch: Colors.blue,
      ),
      home: defaultHome,
      routes:routes,
    );
  }

}
