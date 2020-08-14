
import 'package:flutter/material.dart';


import 'ForgotPasswordPage.dart';

import 'LoginPage.dart';
import 'LoginSelector.dart';
import 'MainPageTwo.dart';

import 'Privacy.dart';



void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(

      debugShowCheckedModeBanner: false,
        home: new LoginSelector(),

        routes: <String, WidgetBuilder>{
          '/login': (_) => new LoginPage(),
          '/mainactivity': (_) => new MainPageTwo(),
          '/PrivacyPage': (_) => new PrivacyPage(),
          '/MainPageTwo': (_) => new MainPageTwo(),
          '/ForgotPasswordPage': (_) => new ForgotPasswordPage(),
          '/LoginSelector': (_) => new LoginSelector(),
            },
        theme: new ThemeData(
          brightness: Brightness.light,
            primaryColor:const Color(0xff0A3F6F) ,
            accentColor: Colors.deepOrange,
            primaryTextTheme:
                TextTheme(title: TextStyle(color: Colors.white))));
  }
}
