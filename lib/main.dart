import 'package:episode/constants/episode_colors.dart';
import 'package:episode/routing/episode_router.dart';
import 'package:episode/ui/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Episode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          minWidth: 500.0,
          height: 41.0,
          buttonColor: EpisodeColors.episodeBlue,
        ),
      ),
      home: Landing(),
      routes: EpisodeRouter.routes,
    );
  }
}
