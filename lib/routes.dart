import 'package:flutter/material.dart';
import 'package:vconekt_interview/screens/login.dart';
import 'package:vconekt_interview/screens/profilescreen.dart';
import 'package:vconekt_interview/screens/signup.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {


  switch(routeSettings.name){
    case SignupScreen.routeName:
      return MaterialPageRoute(
        
        builder: (_) =>  SignupScreen());

    case LoginScreen.routeName:
      return MaterialPageRoute(
        
        builder: (_) =>  LoginScreen());
        case ProfileScreen.routeName:
      return MaterialPageRoute(
        
        builder: (_) =>  ProfileScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => const  Scaffold(
          body: Center(child: Text('Screen does not exist'),),
        ));
  }
}