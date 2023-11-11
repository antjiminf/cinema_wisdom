import 'package:flutter/material.dart';
import 'package:cinema_wisdom/presentation/widgets/widgets.dart';

import 'package:cinema_wisdom/presentation/views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.pageIndex});

  static const String name = 'home-screen';
  final int pageIndex;

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: pageIndex),
    );
  }
}
