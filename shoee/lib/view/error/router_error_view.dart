import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class RouteErrorView extends StatefulWidget {
  final String errorMsg;
  const  RouteErrorView({required this.errorMsg, Key? key}) : super(key: key);

  @override
  State<RouteErrorView> createState() => _RouteErrorViewState();
}

class _RouteErrorViewState extends State<RouteErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.errorMsg)
          ],
        ),
      ),
    );
  }
} 