/// data class representing a user of a certain Web service.
class User {
  final int id;
  final String name;
  final bool isFollowing; // flag whether I follow this user.
  final List<int> followers;

  // get the number of followers including me.
  int get followerCount => followers.length + (isFollowing ? 1 : 0);

  User(
    this.id,
    this.name,
    this.isFollowing,
    this.followers,
  );

  /// copy the instance with given [isFollowing] flag.
  User copyWithFollowing(bool newValue) {
    return User(id, name, newValue, followers);
  }
}
