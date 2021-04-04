class User {
  final String userID;
  final String email;
  final String password;
  final String userName;
  final int height;
  final int weight;
  final int streak;

  User({this.userName, this.userID, this.email, this.password, this.height, this.weight, this.streak});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      userID: json['userID'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      userName: json['userName'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      streak: json['streak'] as int,
    );
  }
}