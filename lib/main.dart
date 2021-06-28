import 'package:auto_route/auto_route.dart';
import 'package:daily_sillimanian_beta/helpers/dsb_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:daily_sillimanian_beta/app/router.gr.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // statusBarColor: Color(0xFF870510),
      // systemNavigationBarColor: Color(0xFF870510),
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(ProviderScope(child: DailySillimanBetaApp()));
}

class DailySillimanBetaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Daily Sillimanian Beta',
      theme: AppTheme(context),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
