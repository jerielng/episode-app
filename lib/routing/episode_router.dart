import 'package:episode/routing/navigation_route.dart';
import 'package:episode/ui/add_shows.dart';
import 'package:episode/ui/my_shows.dart';

class EpisodeRouter {
  static var routes = {
    NavigationRoute.addShows: (context) => AddShows(),
    NavigationRoute.myShows: (context) => MyShows(),
  };
}
