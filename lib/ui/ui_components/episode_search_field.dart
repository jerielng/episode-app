import 'package:episode/constants/episode_colors.dart';
import 'package:flutter/material.dart';

class EpisodeSearchField extends StatelessWidget {
  const EpisodeSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: const TextStyle(color: EpisodeColors.black, fontSize: 12),
        decoration: InputDecoration(
          filled: true,
          fillColor: EpisodeColors.gray,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: EpisodeColors.fadedBlack,
            fontSize: 12,
          ),
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: EpisodeColors.black,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 40),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
