class User {
  int id;
  String userName;
  List<int> showIds;
  Map<int, List<int>> watchedEpisodeIds;
  List<int> friendIds;
  List<int> badgeIds;

  User(
    this.id,
    this.userName,
    this.showIds,
    this.watchedEpisodeIds,
    this.friendIds,
  );
}
