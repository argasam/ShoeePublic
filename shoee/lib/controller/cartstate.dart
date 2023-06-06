import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartState extends ChangeNotifier {
  String? successMessage;
  bool? successStatus;

  void setSuccessMessage(String message) {
    successMessage = message;
    successStatus = true;
    notifyListeners();
  }
  void setFailed(String message) {
    successMessage = message;
    successStatus = false;
    notifyListeners();
  }
}

final cartStateProvider = ChangeNotifierProvider<CartState>((ref) => CartState());