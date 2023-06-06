import 'package:flutter/material.dart';
import 'package:shoee/view/bottom_navigation_bar_widget.dart';

class DashboardView extends StatefulWidget {
  final Widget child;
  const DashboardView({required this.child, Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}