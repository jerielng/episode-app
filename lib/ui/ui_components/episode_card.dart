import 'package:episode/constants/episode_colors.dart';
import 'package:flutter/material.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.title,
    required this.isWatched,
    required this.onTap,
  });

  final String title;
  final bool isWatched;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: isWatched,
      label: '$title, ${isWatched ? 'watched' : 'unwatched'}',
      child: Material(
        color: EpisodeColors.gray,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox.square(
            dimension: 160,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Opacity(
                      opacity: isWatched ? 0.4 : 1,
                      child: Image.asset(
                        'assets/images/episode-episode.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  color: isWatched
                      ? EpisodeColors.episodeGreen
                      : EpisodeColors.episodeBlue,
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Icon(
                        isWatched
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
