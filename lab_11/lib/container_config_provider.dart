import 'package:flutter/material.dart';

class ContainerConfigProvider with ChangeNotifier {
  double _width = 100.0;
  double _height = 100.0;
  double _borderRadius = 0.0;

  double get width => _width;
  double get height => _height;
  double get borderRadius => _borderRadius;

  void setWidth(double newWidth) {
    _width = newWidth;
    notifyListeners();
  }

  void setHeight(double newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void setBorderRadius(double newRadius) {
    _borderRadius = newRadius;
    notifyListeners();
  }
}