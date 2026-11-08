import 'package:episode/constants/episode_colors.dart';
import 'package:episode/constants/episode_strings.dart';
import 'package:episode/data/episode_store.dart';
import 'package:episode/routing/navigation_route.dart';
import 'package:episode/ui/episode_button_style.dart';
import 'package:episode/ui/ui_components/episode_app_bar.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key, required this.store});

  final EpisodeStore store;

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: EpisodeAppBar(
        title: EpisodeStrings.titleWelcomeBack,
        onMenu: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: _EpisodeDrawer(store: widget.store),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/episode-home.jpg', fit: BoxFit.cover),
          ColoredBox(color: Colors.white.withValues(alpha: 0.7)),
          Align(
            alignment: const Alignment(0, 0.2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _HomeButton(
                  label: EpisodeStrings.buttonFindNewShow,
                  onPressed: () =>
                      Navigator.pushNamed(context, NavigationRoute.addShows),
                ),
                const SizedBox(height: 20),
                _HomeButton(
                  label: EpisodeStrings.buttonAddEpisodeToShows,
                  onPressed: () =>
                      Navigator.pushNamed(context, NavigationRoute.myShows),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174,
      height: 41,
      child: ElevatedButton(
        onPressed: onPressed,
        style: EpisodeButtonStyle.basic.copyWith(
          backgroundColor: const WidgetStatePropertyAll(
            EpisodeColors.episodeBlue,
          ),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 6),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class _EpisodeDrawer extends StatelessWidget {
  const _EpisodeDrawer({required this.store});

  final EpisodeStore store;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: EpisodeColors.episodeBlue),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedBuilder(
                  animation: store,
                  builder: (context, _) => Text(
                    'Episode\n${store.userName}',
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            ),
            _DrawerLink(
              icon: Icons.tv,
              label: 'My Shows',
              route: NavigationRoute.myShows,
            ),
            _DrawerLink(
              icon: Icons.search,
              label: 'Find a New Show',
              route: NavigationRoute.addShows,
            ),
            _DrawerLink(
              icon: Icons.emoji_events_outlined,
              label: 'Badges',
              route: NavigationRoute.badges,
            ),
            const Divider(),
            _DrawerLink(
              icon: Icons.login,
              label: 'Log In',
              route: NavigationRoute.logIn,
            ),
            _DrawerLink(
              icon: Icons.person_add_alt,
              label: 'Sign Up',
              route: NavigationRoute.signUp,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  const _DrawerLink({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: EpisodeColors.episodeBlue),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
