import 'package:episode/models/show.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatelessWidget {
  final Show show;

  ShowCard({Show show}) : this.show = show;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Image(image: ,),
          Text(show.name),
        ],
      ),
    );
  }
}
