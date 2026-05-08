import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:on_fire/featuers/alerts/presentation/view/screen/alerts_screen.dart';
import 'package:on_fire/featuers/analytics/presentation/view/screens/analytic_screen.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/screens/dash_bord_screen.dart';
import 'package:on_fire/featuers/splash/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        DashBordScreen.routeName: (context) => DashBordScreen(),
        AlertsScreen.routName:(context)=>AlertsScreen(),
        AnalyticScreen.routeName:(context)=>AnalyticScreen()
      },
    );
  }
}
