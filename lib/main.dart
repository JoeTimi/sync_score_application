import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/consts.dart';
import 'screens/initial_screens/splash_screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: mainAppColor,
        ),
        fontFamily: "Fellix",
      ),
      home: const SplashScreen(),
    );
  }
}
