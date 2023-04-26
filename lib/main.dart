import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wave_tune/screens/home_screen.dart';
import 'package:wave_tune/components/bottom_navigation.dart';
import 'package:wave_tune/screens/login_screen.dart';
import 'package:wave_tune/screens/playlist_screen.dart';
import 'package:wave_tune/screens/register_screen.dart';

void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
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
          '/playList': (BuildContext context) => const PlaylistScreen(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(
          builder: (ctx) => builder(ctx),
        );
      },
    );
  }
}
