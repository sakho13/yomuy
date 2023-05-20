import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationBarScaffold extends StatelessWidget {
  const NavigationBarScaffold({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_sharp),
            label: "一覧",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "検索",
          ),
        ],
        currentIndex: _selectedIndex(context),
        onTap: (value) => _onTap(value, context),
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouter.of(context).location;
    print(location);
    if (location.startsWith("/novels")) {
      return 0;
    }
    if (location.startsWith("/search")) {
      return 1;
    }
    return 0;
  }

  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go("/novels");
        break;
      case 1:
        GoRouter.of(context).go("/search");
        break;
    }
  }
}
