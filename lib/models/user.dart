class User {
  final int id;
  final String userName;
  final List<int> showIds;
  final Map<int, List<int>> watchedEpisodeIds;
  final List<int> friendIds;
  final List<int> badgeIds;

  const User(
    this.id,
    this.userName,
    this.showIds,
    this.watchedEpisodeIds,
    this.friendIds,
    this.badgeIds,
  );
}
