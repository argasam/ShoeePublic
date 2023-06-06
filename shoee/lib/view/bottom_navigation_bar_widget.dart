import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/controller/dashboard_controller.dart';
import 'package:shoee/controller/login/login_controller.dart';
import 'package:shoee/route/go_router_notifer.dart';
import 'package:shoee/view/acc_view.dart';
import 'package:shoee/view/cart_view.dart';
import 'package:shoee/view/custom_view.dart';
import 'package:shoee/view/home_view.dart';

class BottomNavigationBarWidget extends ConsumerStatefulWidget {

  BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>_BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState
    extends ConsumerState<BottomNavigationBarWidget> {

  @override
  Widget build(BuildContext context) {
    
    final position = ref.watch(dashboardControllerProvider);
    

    return BottomNavigationBar(
      
      currentIndex: position,
      onTap: (value) =>  _onTap(value),
      type:  BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromRGBO(101, 99, 255, 1.0),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.palette),
          label: 'Kustomisasi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Keranjang',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun Saya',
        ),
      ],
    );
  }

  void _onTap(int index){
    ref.read(dashboardControllerProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/custom');
        break;
      case 2:
        context.go('/cart');
        break;
      case 3:
        context.go('/acc');
        break;  
      default:
    }
  }
}
