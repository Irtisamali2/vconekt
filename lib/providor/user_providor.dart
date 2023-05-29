import 'package:flutter/widgets.dart';
import 'package:vconekt_interview/models/userData.dart';
import 'package:vconekt_interview/resources/authentication.dart';

class UserProvider with ChangeNotifier {
  UserData? _user;
  final Authentication _authentication = Authentication();
  

  UserData? get getUser =>_user;

  Future<void> Userupdated() async{
    UserData user = await _authentication.getUserData();
    _user = user;
    notifyListeners();
  }

}