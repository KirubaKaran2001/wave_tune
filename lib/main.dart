import 'package:flutter/material.dart';
import 'package:wave_tune/screens/home_screen.dart';
import 'package:wave_tune/screens/main_screen.dart';
import 'package:wave_tune/screens/login_screen.dart';
import 'package:wave_tune/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        debugPrint('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/register': (BuildContext context) => const RegisterScreen(),
          '/login': (BuildContext context) => const LoginScreen(),
          '/main': (BuildContext context) => const MainScreen(),
          '/home': (BuildContext context) => const HomeScreen(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
