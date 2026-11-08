import 'package:episode/constants/episode_colors.dart';
import 'package:episode/constants/episode_strings.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/routing/episode_router.dart';
import 'package:episode/ui/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EpisodeApp(store: EpisodeStore()));
}

class EpisodeApp extends StatelessWidget {
  const EpisodeApp({super.key, required this.store});

  final EpisodeStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: EpisodeStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: EpisodeColors.episodeBlue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: EpisodeColors.episodeBlue,
          secondary: EpisodeColors.episodeGreen,
          error: EpisodeColors.episodeRed,
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: EpisodeColors.black,
          onSurface: EpisodeColors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: EpisodeColors.episodeBlue,
          foregroundColor: Colors.white,
        ),
      ),
      home: Landing(store: store),
      routes: EpisodeRouter.routes(store),
    );
  }
}
