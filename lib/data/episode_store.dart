import 'package:episode/models/badge.dart';
import 'package:episode/models/show.dart';
import 'package:flutter/foundation.dart';

class EpisodeStore extends ChangeNotifier {
  final List<Show> _catalog = const [
    Show(1, 'Better Call Paul', 1, [
      1,
      2,
      3,
      4,
      5,
      6,
    ], 'assets/images/episode-series.jpg'),
    Show(2, 'Breaking Bard', 1, [
      1,
      2,
      3,
      4,
      5,
      6,
    ], 'assets/images/episode-series.jpg'),
    Show(3, 'Game of Bones', 1, [
      1,
      2,
      3,
      4,
      5,
      6,
    ], 'assets/images/episode-series.jpg'),
    Show(4, 'Mr. Bro-Bot', 1, [
      1,
      2,
      3,
      4,
      5,
      6,
    ], 'assets/images/episode-series.jpg'),
  ];

  final Set<int> _myShowIds = {1, 2};
  final Map<int, Set<int>> _watchedEpisodes = {
    1: {1, 2, 3},
    2: {1, 2, 3},
  };

  final List<Badge> badges = const [
    Badge(1, 'First Episode', 'Mark your first episode as watched.'),
    Badge(2, 'Binge Watcher', 'Finish every episode in a show.'),
    Badge(3, 'Show Collector', 'Add three shows to your list.'),
  ];

  String userName = 'TV fan';

  void setUserName(String name) {
    userName = name.trim();
    notifyListeners();
  }

  List<Show> get catalog => List.unmodifiable(_catalog);

  List<Show> get myShows =>
      _catalog.where((show) => _myShowIds.contains(show.id)).toList();

  bool hasShow(int showId) => _myShowIds.contains(showId);

  bool isEpisodeWatched(int showId, int episodeId) =>
      _watchedEpisodes[showId]?.contains(episodeId) ?? false;

  List<Show> searchCatalog(String query) => _search(_catalog, query);

  List<Show> searchMyShows(String query) => _search(myShows, query);

  void addShow(Show show) {
    if (!_catalog.any((item) => item.id == show.id) ||
        !_myShowIds.add(show.id)) {
      return;
    }
    _watchedEpisodes.putIfAbsent(show.id, () => <int>{});
    notifyListeners();
  }

  void toggleEpisode(int showId, int episodeId) {
    final watched = _watchedEpisodes.putIfAbsent(showId, () => <int>{});
    if (!watched.add(episodeId)) {
      watched.remove(episodeId);
    }
    notifyListeners();
  }

  void markAllEpisodes(int showId, {required bool watched}) {
    final show = _catalog.firstWhere((item) => item.id == showId);
    final episodes = _watchedEpisodes.putIfAbsent(showId, () => <int>{});
    if (watched) {
      episodes.addAll(show.episodeIds);
    } else {
      episodes.clear();
    }
    notifyListeners();
  }

  bool allEpisodesWatched(int showId) {
    final show = _catalog.firstWhere((item) => item.id == showId);
    return show.episodeIds.every(
      (episodeId) => isEpisodeWatched(showId, episodeId),
    );
  }

  bool isBadgeEarned(int badgeId) {
    switch (badgeId) {
      case 1:
        return _watchedEpisodes.values.any((episodes) => episodes.isNotEmpty);
      case 2:
        return _catalog.any((show) => allEpisodesWatched(show.id));
      case 3:
        return _myShowIds.length >= 3;
      default:
        return false;
    }
  }

  List<Show> _search(List<Show> shows, String query) {
    final term = query.trim().toLowerCase();
    if (term.isEmpty) return List.unmodifiable(shows);
    return shows
        .where((show) => show.name.toLowerCase().contains(term))
        .toList();
  }
}
