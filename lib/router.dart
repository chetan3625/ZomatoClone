import 'package:flutter/material.dart';
import 'package:iosandandroid/view/auth/authscreen.dart';
import 'package:iosandandroid/view/auth/email.dart';

Route<MaterialPageRoute> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case Authscreen.routeName:
      return MaterialPageRoute(builder: (_)=>Authscreen());

      case SignInWithEmail.routename:
        return MaterialPageRoute(builder: (_)=>SignInWithEmail());

      default:
      return MaterialPageRoute(builder: (_)=>Scaffold(
        body: Center(child: Text("Something went wrong")),
      ));


  }

}