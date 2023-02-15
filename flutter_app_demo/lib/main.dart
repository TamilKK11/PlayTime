import 'package:flutter/material.dart';
import 'package:flutter_app_demo/SupportFiles/constants.dart';
import 'package:flutter_app_demo/Views/gameOverPage.dart';
import 'package:flutter_app_demo/Views/homepage.dart';
import 'package:flutter_app_demo/Views/playpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/gameoverpage') {
          final args = settings.arguments;
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) =>
                 GameOverPage(args),
          );
        }
      },
      title: Constants.homePageTitle,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
        '/playpage': (BuildContext context) => const PlayPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
