import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  String _name, _lastname;
  int _age;

  String get name => _name;
  String get lastname => _lastname;
  int get age => _age;

  void setAge(int age) {
    this._age = age;
    notifyListeners();
  }

  void setName(String name) {
    this._name = name;

    notifyListeners();
  }

  void setLastname(String lastname) {
    this._lastname = lastname;
    notifyListeners();
  }

  void logOut() {
    this._name = null;
    this._lastname = null;
    this._age = null;
    notifyListeners();
  }
}
