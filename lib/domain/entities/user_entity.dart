import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/data/enums/pose.dart';
import 'package:zeely_ai_test_app/data/models/user_model.dart';

class UserEntity {
  final String name;
  final String imageLink;
  final Gender gender;
  final int age;
  final Pose pose;

  const UserEntity({
    required this.name,
    required this.imageLink,
    required this.gender,
    required this.age,
    required this.pose,
  });

  UserModel toModel() {
    return UserModel(
      name: name,
      imageLink: imageLink,
      gender: gender,
      age: age,
      pose: pose,
    );
  }
}
