import 'package:episode/constants/episode_colors.dart';
import 'package:flutter/material.dart';

class EpisodeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EpisodeAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onMenu,
  });

  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onMenu;

  @override
  Size get preferredSize => const Size.fromHeight(47);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 47,
      backgroundColor: EpisodeColors.episodeBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      leading: onBack == null && onMenu == null
          ? null
          : IconButton(
              tooltip: onBack == null ? 'Open menu' : 'Back',
              icon: Icon(onBack == null ? Icons.menu : Icons.arrow_back),
              onPressed: onBack ?? onMenu,
            ),
    );
  }
}
