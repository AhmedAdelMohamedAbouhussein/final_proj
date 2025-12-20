class LoginResponseModel
{
  final String? accessToken;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  LoginResponseModel(this.accessToken,
      this.refreshToken,
      this.id,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.image,);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        json['accessToken'],
        json['refreshToken'],
        json['id'],
        json['username'],
        json['email'],
        json['firstName'],
        json['lastName'],
        json['gender'],
        json['image']);
  }
}