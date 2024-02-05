import 'package:flutter/material.dart';
import 'package:flutter_application/ui/navigation/main_navigation.dart';

abstract class MyAppNavigation {
  Map<String, Widget Function(BuildContext)> get routes;
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final navigation = MainNavigation();
  MyApp({super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: navigation.routes,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
