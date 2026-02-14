// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  name: json['name'] as String,
  imageLink: json['imageLink'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  age: (json['age'] as num).toInt(),
  pose: $enumDecode(_$PoseEnumMap, json['pose']),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'name': instance.name,
  'imageLink': instance.imageLink,
  'gender': _$GenderEnumMap[instance.gender]!,
  'age': instance.age,
  'pose': _$PoseEnumMap[instance.pose]!,
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$PoseEnumMap = {
  Pose.standing: 'standing',
  Pose.sitting: 'sitting',
  Pose.selfie: 'selfie',
  Pose.carSelfie: 'carSelfie',
  Pose.walking: 'walking',
};
