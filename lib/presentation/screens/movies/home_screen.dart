import 'package:flutter/material.dart';
import 'package:cinema_wisdom/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.childView});

  final Widget childView;

  static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
