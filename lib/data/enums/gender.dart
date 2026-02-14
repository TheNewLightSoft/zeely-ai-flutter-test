enum Gender { male, female }

extension GenderExtension on Gender {
  static Gender fromString(String gender) => switch (gender) {
    'Men' => Gender.male,
    'Women' => Gender.female,
    _ => throw ArgumentError('Unknown gender: $gender'),
  };

  String get label => switch (this) {
    Gender.male => 'Men',
    Gender.female => 'Women',
  };
}
