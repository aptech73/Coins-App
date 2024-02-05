import 'package:flutter/material.dart';
import 'package:flutter_application/ui/navigation/main_navigation_routes.dart';
import 'package:flutter_application/ui/screen_factory/screen_factory.dart';
import 'package:flutter_application/ui/widgets/app/my_app.dart';

class MainNavigation implements MyAppNavigation {
  final _screenFactory = ScreenFactory();

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutes.coinDetails:
        final arguments = settings.arguments;
        final movieId = arguments is String ? arguments : "";
        return MaterialPageRoute(
          builder: (_) => _screenFactory.makeCoinDetailsWidget(movieId),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }

  @override
  Map<String, Widget Function(BuildContext context)> get routes => {
    MainNavigationRoutes.main: (_) => _screenFactory.makeCoinListWidget(),
  };
}