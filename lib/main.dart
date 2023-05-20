import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yomuy/components/navigation_bar_scaffold.dart';
import 'package:yomuy/screens/novel_screen.dart';
import 'package:yomuy/screens/search_screen.dart';
import 'package:yomuy/screens/settings_screen.dart';

import 'screens/home_screen.dart';
import 'screens/unknown_screen.dart';
import 'statics/color_schemes.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = GoRouter(
    initialLocation: "/novels",
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return NavigationBarScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: "/novels",
            name: HomePage.pageName,
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: "settings",
                name: SettingsPage.pageName,
                builder: (context, state) => const SettingsPage(),
              ),
              GoRoute(
                path: ":ncode",
                builder: (context, state) {
                  final ncode = state.pathParameters["ncode"];

                  if (ncode != null) {
                    return NovelScreen(ncode: ncode);
                  } else {
                    return UnknownScreen();
                  }
                },
              )
            ],
          ),
          GoRoute(
            path: "/search",
            name: SearchPage.pageName,
            builder: (context, state) => const SearchPage(),
          ),
        ],
      )
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const UnknownScreen(),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'YOMUY',
      routerConfig: _router,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
