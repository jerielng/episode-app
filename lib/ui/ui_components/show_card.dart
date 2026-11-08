import 'package:episode/constants/episode_colors.dart';
import 'package:episode/models/show.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({
    super.key,
    required this.show,
    required this.onTap,
    this.isSaved = false,
    this.isAdded = false,
  });

  final Show show;
  final VoidCallback onTap;
  final bool isSaved;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    final color = isSaved
        ? EpisodeColors.episodeGreen
        : EpisodeColors.episodeBlue;
    return Semantics(
      button: true,
      label: isAdded ? '${show.name}, already in My Shows' : show.name,
      child: Material(
        color: EpisodeColors.gray,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isAdded ? null : onTap,
          child: SizedBox(
            height: 164,
            child: Column(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Image.asset(show.imageName, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 43,
                  child: ColoredBox(
                    color: color,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              show.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          if (isAdded)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 19,
                            ),
                        ],
                      ),
                    ),
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
