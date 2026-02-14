import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/data/enums/pose.dart';
import 'package:zeely_ai_test_app/data/mock/users.dart';
import 'package:zeely_ai_test_app/domain/entities/user_entity.dart';

@immutable
class AgeBracket {
  const AgeBracket({required this.title, required this.min, this.max});

  final String title;
  final int min;
  final int? max;

  String get subtitle => max == null ? '$min+' : '$min–$max';

  bool contains(int age) {
    if (age < min) return false;
    final m = max;
    if (m == null) return true;
    return age <= m;
  }
}

const ageBrackets = <AgeBracket>[
  AgeBracket(title: 'Young adults', min: 18, max: 24),
  AgeBracket(title: 'Adults', min: 25, max: 39),
  AgeBracket(title: 'Middle-aged adults', min: 40, max: 64),
  AgeBracket(title: 'Older adults', min: 65),
];

class AppController extends GetxController with WidgetsBindingObserver {
  final items = users.obs;

  final selectedGenders = <Gender>{}.obs;
  final selectedPoses = <Pose>{}.obs;

  final selectedAgeBrackets = <AgeBracket>{}.obs;

  List<UserEntity> get filteredItems {
    final genders = selectedGenders;
    final poses = selectedPoses;
    final ages = selectedAgeBrackets;

    return items
        .where((u) {
          if (genders.isNotEmpty && !genders.contains(u.gender)) return false;
          if (poses.isNotEmpty && !poses.contains(u.pose)) return false;

          if (ages.isNotEmpty && !ages.any((b) => b.contains(u.age))) return false;

          return true;
        })
        .toList(growable: false);
  }

  void setGendersFilter(List<Gender> genders) {
    selectedGenders
      ..clear()
      ..addAll(genders);
  }

  void setPosesFilter(List<Pose> poses) {
    selectedPoses
      ..clear()
      ..addAll(poses);
  }

  void setAgeBracketsFilter(List<AgeBracket> brackets) {
    selectedAgeBrackets
      ..clear()
      ..addAll(brackets);
  }

  void toggleAgeBracket(AgeBracket b) {
    selectedAgeBrackets.contains(b)
        ? selectedAgeBrackets.remove(b)
        : selectedAgeBrackets.add(b);
  }

  bool get hasFilters =>
      selectedGenders.isNotEmpty ||
      selectedPoses.isNotEmpty ||
      selectedAgeBrackets.isNotEmpty;

  void clearFilters() {
    selectedGenders.clear();
    selectedPoses.clear();
    selectedAgeBrackets.clear();
  }
}
