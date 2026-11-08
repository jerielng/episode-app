import 'package:episode/constants/episode_colors.dart';
import 'package:episode/constants/episode_strings.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/models/show.dart';
import 'package:episode/ui/ui_components/episode_app_bar.dart';
import 'package:episode/ui/ui_components/episode_card.dart';
import 'package:episode/ui/ui_components/episode_search_field.dart';
import 'package:episode/ui/ui_components/show_card.dart';
import 'package:flutter/material.dart';

class MyShows extends StatefulWidget {
  const MyShows({super.key, required this.store});

  final EpisodeStore store;

  @override
  State<MyShows> createState() => _MyShowsState();
}

class _MyShowsState extends State<MyShows> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EpisodeAppBar(
        title: EpisodeStrings.titleMyShows,
        onBack: () => Navigator.maybePop(context),
      ),
      body: AnimatedBuilder(
        animation: widget.store,
        builder: (context, _) {
          final shows = widget.store.searchMyShows(_query);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 19, 12, 19),
                child: EpisodeSearchField(
                  controller: _searchController,
                  hintText: 'Search',
                  onChanged: (query) => setState(() => _query = query),
                ),
              ),
              Expanded(
                child: shows.isEmpty
                    ? const _EmptyMessage(
                        icon: Icons.tv_outlined,
                        message:
                            'No shows found. Add a show to start tracking episodes.',
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                        itemCount: shows.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 19),
                        itemBuilder: (context, index) => ShowCard(
                          show: shows[index],
                          isSaved: true,
                          onTap: () => _openEpisodes(context, shows[index]),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _openEpisodes(BuildContext context, Show show) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => _ShowEpisodes(store: widget.store, show: show),
      ),
    );
  }
}

class _ShowEpisodes extends StatelessWidget {
  const _ShowEpisodes({required this.store, required this.show});

  final EpisodeStore store;
  final Show show;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EpisodeAppBar(
        title: EpisodeStrings.titleMyShows,
        onBack: () => Navigator.maybePop(context),
      ),
      body: AnimatedBuilder(
        animation: store,
        builder: (context, _) {
          final allWatched = store.allEpisodesWatched(show.id);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 14),
                child: SizedBox(
                  width: 174,
                  height: 41,
                  child: allWatched
                      ? OutlinedButton(
                          onPressed: () =>
                              store.markAllEpisodes(show.id, watched: false),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: EpisodeColors.episodeBlue,
                            side: const BorderSide(
                              color: EpisodeColors.episodeBlue,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            EpisodeStrings.buttonMarkAllUnwatched,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () =>
                              store.markAllEpisodes(show.id, watched: true),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: EpisodeColors.episodeBlue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text(
                            EpisodeStrings.buttonMarkAllWatched,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  itemCount: show.episodeIds.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 25,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final episodeId = show.episodeIds[index];
                    return EpisodeCard(
                      title: 'Episode $episodeId',
                      isWatched: store.isEpisodeWatched(show.id, episodeId),
                      onTap: () => store.toggleEpisode(show.id, episodeId),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _EmptyMessage extends StatelessWidget {
  const _EmptyMessage({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: EpisodeColors.gray),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
