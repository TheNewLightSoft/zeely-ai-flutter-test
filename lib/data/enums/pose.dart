enum Pose { standing, sitting, selfie, carSelfie, walking }

extension PoseExtension on Pose {
  static Pose fromString(String pose) => switch (pose) {
    'Standing' => Pose.standing,
    'Sitting' => Pose.sitting,
    'Selfie' => Pose.selfie,
    'Car Selfie' => Pose.carSelfie,
    'Walking' => Pose.walking,
    _ => throw ArgumentError('Unknown pose: $pose'),
  };

  String get label => switch (this) {
    Pose.standing => 'Standing',
    Pose.sitting => 'Sitting',
    Pose.selfie => 'Selfie',
    Pose.carSelfie => 'Car Selfie',
    Pose.walking => 'Walking',
  };
}
