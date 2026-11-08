import 'package:episode/data/episode_store.dart';
import 'package:episode/routing/navigation_route.dart';
import 'package:episode/ui/add_shows.dart';
import 'package:episode/ui/badges.dart';
import 'package:episode/ui/log_in.dart';
import 'package:episode/ui/my_shows.dart';
import 'package:episode/ui/sign_up.dart';
import 'package:flutter/material.dart';

class EpisodeRouter {
  static Map<String, WidgetBuilder> routes(EpisodeStore store) => {
    NavigationRoute.addShows: (_) => AddShows(store: store),
    NavigationRoute.myShows: (_) => MyShows(store: store),
    NavigationRoute.logIn: (_) => LogIn(store: store),
    NavigationRoute.signUp: (_) => SignUp(store: store),
    NavigationRoute.badges: (_) => Badges(store: store),
  };
}
