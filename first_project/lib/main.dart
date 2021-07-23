import 'package:first_project/screens/home/home_screen.dart';
import 'package:first_project/screens/songText/song_text_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiewnk',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SongTextScreen.routeName: (context) => SongTextScreen(),
      },
    );
  }
}
