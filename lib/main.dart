import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_fire/core/di/service_locator.dart';
import 'package:on_fire/featuers/alerts/presentation/view/screen/alerts_screen.dart';
import 'package:on_fire/featuers/analytics/presentation/view/screens/analytic_screen.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/screens/dash_bord_screen.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_cubit.dart';
import 'package:on_fire/featuers/main_layout/presentation/screens/main_layout_screen.dart';
import 'package:on_fire/featuers/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<OnFireCubit>()..listenToFire(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          DashBordScreen.routeName: (context) => DashBordScreen(),
          AlertsScreen.routName: (context) => AlertsScreen(),
          AnalyticScreen.routeName: (context) => AnalyticScreen(),
          MainLayoutScreen.routeName: (context) => MainLayoutScreen(),
        },
      ),
    );
  }
}

// Icon launcher Helper:
// 1- add package flutter_launcher_icons in pubspec.yaml
// icons app logo
// 2- app IOS & Android:
// # size 1024x1024
// # PNG
// # no alpha (no transparency)
// # no rounded corners
// # example:
// assets/icons/app_icon.png

// write in pubspec.yaml
// dev_dependencies:
//   flutter_launcher_icons: ^0.13.1

// flutter_icons:
//   android: true
//   ios: true
//   image_path: "assets/icons/app_icon.png"
//   adaptive_icon_background: "#5F33E1"
//   adaptive_icon_foreground: "assets/icons/app_icon_logo.png"
//   remove_alpha_ios: true

// final run this
// flutter pub get
// dart run flutter_launcher_icons