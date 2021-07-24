import 'package:flutter/material.dart';

class EpisodeButtonStyle {
  static ButtonStyle get basic {
    return ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))));
  }
}
