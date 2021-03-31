import 'package:ethica_room/pages/bye_bye.dart';
import 'package:ethica_room/pages/everyones_idea.dart';
import 'package:ethica_room/pages/your_idea.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ethica_room/pages/hello.dart';
import 'package:ethica_room/pages/about_ethics.dart';
import 'package:ethica_room/pages/home.dart';
import 'package:ethica_room/pages/abstract.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja', ''),
      ],
      title: 'エチカの部屋',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.teal[800],
          fontFamily: 'ShipporiMincho'),
      routes: {
        '/': (context) => Home(),
        '/hello': (context) => HelloPage(),
        '/about-ethics': (context) => AboutEthicsPage(),
        '/abstract': (context) => AbstractPage(),
        '/your-idea': (context) => YourIdeaPage(),
        '/everyones-idea': (context) => EveryonesIdeaPage(),
        '/bye-bye': (context) => ByeByePage(),
      },
    );
  }
}
