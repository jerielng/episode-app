import 'package:episode/constants/episode_strings.dart';
import 'package:flutter/material.dart';

class AddShows extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddShowsState();
  }
}

class _AddShowsState extends State<AddShows> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      title: Text(EpisodeStrings.titleAddShow),
      leading: IconButton(
        icon: Icon(Icons.backup),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
