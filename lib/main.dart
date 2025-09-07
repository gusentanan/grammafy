import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grammafy/core/bloc_observers/observer.dart';
import 'package:grammafy/core/injections/injection.dart';
import 'package:grammafy/core/routes/grammafy_routes.dart';
import 'package:grammafy/themes/grammafy_theme.dart';
import 'package:grammafy/utils/styles_utils.dart';

void main() async {
  BlocOverrides.runZoned(
    () => _runGrammafyApp(),
    blocObserver: GrammafyBlocObserver(),
  );
}

void _runGrammafyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setStatusBar();
  
  // Move heavy initialization off main thread where possible
  await _initializeApp();
  
  runApp(const GrammafyApp());
}

Future<void> _initializeApp() async {
  // Load environment variables
  await dotenv.load();
  
  // Configure dependency injection
  configureInjection();
  
  // Set screen orientation (this is lightweight)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  // Note: ScreenUtil.ensureScreenSize() moved to app initialization
}

class GrammafyApp extends StatelessWidget {
  const GrammafyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<GrammafyRoutes>();
    setupScreenUtil(context);

    return MaterialApp.router(
      title: 'Grammafy',
      theme: baseTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
