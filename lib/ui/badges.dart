import 'package:episode/constants/episode_colors.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/models/badge.dart' as episode_model;
import 'package:episode/ui/ui_components/episode_app_bar.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  const Badges({super.key, required this.store});

  final EpisodeStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EpisodeAppBar(title: 'Badges'),
      body: AnimatedBuilder(
        animation: store,
        builder: (context, _) => ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: store.badges.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final badge = store.badges[index];
            return _BadgeCard(
              badge: badge,
              earned: store.isBadgeEarned(badge.id),
            );
          },
        ),
      ),
    );
  }
}

class _BadgeCard extends StatelessWidget {
  const _BadgeCard({required this.badge, required this.earned});

  final episode_model.Badge badge;
  final bool earned;

  @override
  Widget build(BuildContext context) {
    final color = earned
        ? EpisodeColors.episodeGreen
        : EpisodeColors.episodeBlue;
    return SizedBox(
      height: 126,
      child: Row(
        children: [
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(
              earned ? Icons.emoji_events : Icons.lock_outline,
              size: 46,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 112,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    badge.name,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Text(
                      badge.description,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
