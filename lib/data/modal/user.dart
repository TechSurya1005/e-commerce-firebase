class UserData {
  final String? username;
  final String? email;
  final String? password;
  final String? gender;

  UserData({
    this.username,
    this.email,
    this.password,
    this.gender,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      gender: json['gender']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'gender': gender,
    };
  }
}
