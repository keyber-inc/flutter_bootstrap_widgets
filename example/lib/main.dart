import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets_example/pages/alerts_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/buttons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/forms_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/icons_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/modals_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/panels_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/tables_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/top_page.dart';
import 'package:flutter_bootstrap_widgets_example/pages/typography_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  static const MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Color(0xFF9D9D9D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: themeBlack,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeBlack,
            ),
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeTextPrimary,
            ),
        primaryIconTheme: IconThemeData(
          color: themeTextPrimary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        print('onGenerateRoute(): settings = $settings}');
        final page = _getPageWidget(settings);
        if (page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: child,
                );
              });
        }
        return null;
      },
    );
  }

  Widget _getPageWidget(RouteSettings settings) {
    final uri = Uri.parse(settings.name);
    switch (uri.path) {
      case TopPage.route:
        return TopPage();
      case TypographyPage.route:
        return TypographyPage();
      case TablesPage.route:
        return TablesPage();
      case FormsPage.route:
        return FormsPage();
      case ButtonsPage.route:
        return ButtonsPage();
      case IconsPage.route:
        return IconsPage();
      case AlertsPage.route:
        return AlertsPage();
      case ModalsPage.route:
        return ModalsPage();
      case PanelsPage.route:
        return PanelsPage();
    }
    return null;
  }
}
