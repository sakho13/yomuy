import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yomuy/screens/home_screen.dart';
import 'package:yomuy/screens/search_screen.dart';
import 'package:yomuy/screens/settings_screen.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("一覧"),
            onTap: () => context.goNamed(HomePage.pageName),
          ),
          ListTile(
            title: const Text("検索"),
            onTap: () => context.pushNamed(SearchPage.pageName),
          ),
          ListTile(
            title: const Text("設定"),
            onTap: () => context.pushNamed(SettingsPage.pageName),
          ),
        ],
      ),
    );
  }
}
