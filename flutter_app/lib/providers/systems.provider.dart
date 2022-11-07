import 'package:flutter/cupertino.dart';
import 'package:flutter_app/providers/system.provider.dart';

class Systems extends ChangeNotifier {
  List<System> systems = [];

  List<System> get getSystems {
    return [...systems];
  }

  void addSystem(System system) {
    systems.add(system);
    notifyListeners();
  }
}
