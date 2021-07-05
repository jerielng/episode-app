import 'package:episode/constants/episode_strings.dart';
import 'package:episode/routing/navigation_route.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getFindNewShowButton(context),
            getAddEpisodeButton(context),
          ],
        ),
      ),
    );
  }

  Widget getFindNewShowButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        EpisodeStrings.buttonFindNewShow,
      ),
      onPressed: () => {Navigator.pushNamed(context, NavigationRoute.addShows)},
    );
  }

  Widget getAddEpisodeButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        EpisodeStrings.buttonAddEpisodeToShows,
      ),
      onPressed: () => {Navigator.pushNamed(context, NavigationRoute.myShows)},
    );
  }
}
