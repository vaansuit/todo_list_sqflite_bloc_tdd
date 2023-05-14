class UserModel {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPassword;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      userPassword: json['userPassword'],
    );
  }

  get id => null;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}
