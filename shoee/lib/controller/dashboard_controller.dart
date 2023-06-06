import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/route/go_router_notifer.dart';

final dashboardControllerProvider = StateNotifierProvider<DashboardController,int>((ref){
  
  return DashboardController(0);
  // return DashboardController(0);
});

class DashboardController extends StateNotifier<int> {
  DashboardController(super.state);
  
  void setPosition(int value){
    
    state = value;
  }
}