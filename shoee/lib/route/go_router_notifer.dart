import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoee/controller/login/login_controller.dart';
import 'package:shoee/controller/login/login_state.dart';

final goRouterNotifierProvider = Provider<GoRouterNotifier>((ref) {
  return GoRouterNotifier(
    // ref
    );
});

class GoRouterNotifier extends ChangeNotifier {
  // final Ref _ref;

  // GoRouterNotifier(this._ref){
  //   _ref.listen<LoginState>(
  //     loginControllerProvider, 
  //     (_, __) => notifyListeners(),
  //     );
  // }
  bool _isSignup = false;
  bool get isSignup => _isSignup;
  set isSignup(bool value) {
    _isSignup = value;
    notifyListeners();
  }
  bool _isError = false;
  bool get isError => _isError;
  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

}