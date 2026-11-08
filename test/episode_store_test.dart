import 'package:episode/data/episode_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EpisodeStore', () {
    test('search matches show names without case or surrounding spaces', () {
      final store = EpisodeStore();

      expect(store.searchCatalog('  bArD  ').single.name, 'Breaking Bard');
    });

    test('adds a catalog show once', () {
      final store = EpisodeStore();
      final show = store.catalog[2];

      store.addShow(show);
      store.addShow(show);

      expect(store.hasShow(show.id), isTrue);
      expect(store.myShows.where((item) => item.id == show.id), hasLength(1));
    });

    test('toggling an episode changes its watched state', () {
      final store = EpisodeStore();

      expect(store.isEpisodeWatched(1, 1), isTrue);
      store.toggleEpisode(1, 1);
      expect(store.isEpisodeWatched(1, 1), isFalse);
      store.toggleEpisode(1, 1);
      expect(store.isEpisodeWatched(1, 1), isTrue);
    });

    test('mark all updates every episode in a show', () {
      final store = EpisodeStore();

      store.markAllEpisodes(1, watched: true);
      expect(store.allEpisodesWatched(1), isTrue);

      store.markAllEpisodes(1, watched: false);
      expect(store.allEpisodesWatched(1), isFalse);
      expect(store.isEpisodeWatched(1, 1), isFalse);
    });
  });
}
