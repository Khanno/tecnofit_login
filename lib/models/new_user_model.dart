class NewUserModel {
  final String userEmail;
  final String userPassword;

  NewUserModel({required this.userEmail, required this.userPassword});

  toMap() {
    return {
      "email": userEmail,
      "password": userPassword
    };
  }
}