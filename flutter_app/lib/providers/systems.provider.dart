import 'package:flutter/cupertino.dart';

class Systems extends ChangeNotifier {
  List systems = [];

  Systems({
    required this.systems,
  });

  List get getSystems {
    return [...systems];
  }
}
