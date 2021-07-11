import 'package:episode/constants/episode_strings.dart';
import 'package:flutter/material.dart';

class MyShows extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyShowsState();
  }
}

class _MyShowsState extends State<MyShows> {
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
      title: Text(EpisodeStrings.titleMyShows),
      leading: BackButton(),
    );
  }
}
