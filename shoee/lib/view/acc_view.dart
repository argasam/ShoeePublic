// lib/view/acc_view.dart

// lib/view/home_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:shoee/controller/login/login_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoee/view/bottom_navigation_bar_widget.dart';

class AccView extends StatefulHookConsumerWidget {
  @override
  ConsumerState<AccView> createState() => _AccViewState();
}

class _AccViewState extends ConsumerState<AccView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account'),
            TextButton(
              onPressed: () {
                ref.read(loginControllerProvider.notifier).getOut();
              }, 
              child: Text(
                'Keluar',
                style: TextStyle(fontSize: 20),)
            )
          ],
        ),
      ),
    );
  }
}
