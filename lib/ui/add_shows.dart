import 'package:episode/constants/episode_strings.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/ui/ui_components/episode_app_bar.dart';
import 'package:episode/ui/ui_components/episode_search_field.dart';
import 'package:episode/ui/ui_components/show_card.dart';
import 'package:flutter/material.dart';

class AddShows extends StatefulWidget {
  const AddShows({super.key, required this.store});

  final EpisodeStore store;

  @override
  State<AddShows> createState() => _AddShowsState();
}

class _AddShowsState extends State<AddShows> {
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
        title: EpisodeStrings.titleAddShow,
        onBack: () => Navigator.maybePop(context),
      ),
      body: AnimatedBuilder(
        animation: widget.store,
        builder: (context, _) {
          final shows = widget.store.searchCatalog(_query);
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
                    ? const Center(child: Text('No shows match that search.'))
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                        itemCount: shows.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 19),
                        itemBuilder: (context, index) {
                          final show = shows[index];
                          final isAdded = widget.store.hasShow(show.id);
                          return ShowCard(
                            show: show,
                            isAdded: isAdded,
                            onTap: () {
                              widget.store.addShow(show);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${show.name} added to My Shows',
                                  ),
                                ),
                              );
                            },
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
