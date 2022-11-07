import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  Map user = {};

  Map get _user {
    return {...user};
  }
}
