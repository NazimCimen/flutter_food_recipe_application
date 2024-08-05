import 'package:flutter_food_recipe_application/feauture/auth/auth_export.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.email,
    required super.username,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      userId: user.uid,
      email: user.email,
      username: user.displayName,
    );
  }

  UserEntity toEntity() {
    return UserEntity(userId: userId, email: email, username: username);
  }
}
