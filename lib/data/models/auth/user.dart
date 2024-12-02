import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;

  UserModel({
    this.fullName,
    this.email,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }

  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
