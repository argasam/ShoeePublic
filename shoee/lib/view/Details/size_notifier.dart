import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedSizeNotifier extends ChangeNotifier{
  String? initialsize;

  void setSelectedSize(String size) {
    initialsize = size;
    notifyListeners();
  }
}

final selectedSizeProvider = ChangeNotifierProvider<SelectedSizeNotifier>((ref) {
  return SelectedSizeNotifier();
});

class SelectedColorNotifier extends ChangeNotifier {
  String? initialcolor;
  String? initialimage;

  void setSelectedColor(String color, String image) {
    initialcolor = color;
    initialimage = image;
    notifyListeners();
  }
}

final selectedColorProvider = ChangeNotifierProvider<SelectedColorNotifier>((ref) {
  return SelectedColorNotifier();
});