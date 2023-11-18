import 'package:episode/constants/episode_strings.dart';
import 'package:episode/routing/navigation_route.dart';
import 'package:episode/ui/episode_button_style.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Header')),
            ListTile(
              title: Text('Hello'),
            ),
            ListTile(
              title: Text('hello'),
            )
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(""),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)),
        ),
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                getFindNewShowButton(context),
                getAddEpisodeButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? getAppBar() {
    return AppBar(
      title: Text(
        EpisodeStrings.titleWelcomeBack,
      ),
    );
  }

  Widget getFindNewShowButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        EpisodeStrings.buttonFindNewShow,
      ),
      onPressed: () => {Navigator.pushNamed(context, NavigationRoute.addShows)},
      style: EpisodeButtonStyle.basic,
    );
  }

  Widget getAddEpisodeButton(BuildContext context) {
    return ElevatedButton(
      child: Text(
        EpisodeStrings.buttonAddEpisodeToShows,
      ),
      onPressed: () => {Navigator.pushNamed(context, NavigationRoute.myShows)},
      style: EpisodeButtonStyle.basic,
    );
  }
}
