import 'package:cinema_wisdom/presentation/views/movies/popular_view.dart';
import 'package:flutter/material.dart';
import 'package:cinema_wisdom/presentation/widgets/widgets.dart';

import 'package:cinema_wisdom/presentation/views/views.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.pageIndex});

  static const String name = 'home-screen';
  final int pageIndex;

  static const viewRoutes = <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 200),
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: HomeScreen.viewRoutes,
      ),
      bottomNavigationBar:
          CustomBottomNavigationBar(selectedIndex: widget.pageIndex),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
