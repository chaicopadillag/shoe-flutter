import 'package:flutter/material.dart';

class ShoeProvider with ChangeNotifier {
  String _shoeName = 'assets/shoes/azul.png';
  double _shoeSize = 9.0;

  String get shoeName => _shoeName;

  set shoeName(String value) {
    _shoeName = value;
    notifyListeners();
  }

  double get shoeSize => _shoeSize;

  set shoeSize(double value) {
    _shoeSize = value;
    notifyListeners();
  }
}
