import 'package:json_annotation/json_annotation.dart';
import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/data/enums/pose.dart';
import 'package:zeely_ai_test_app/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel {
  final String name;
  final String imageLink;
  final Gender gender;
  final int age;
  final Pose pose;

  UserModel({
    required this.name,
    required this.imageLink,
    required this.gender,
    required this.age,
    required this.pose,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      imageLink: imageLink,
      gender: gender,
      age: age,
      pose: pose,
    );
  }
}
