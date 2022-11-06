import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String userId;
  String token;

  User({
    required this.userId,
    required this.token,
  });
}
