# Zeely AI Test App

Test assignment built with Flutter.

This application displays a grid of user avatars with filtering by gender, age bracket and pose.
Data is mocked locally (no backend).

---

## Environment

Required by assignment:

* **Flutter**: 3.38.9
* **Dart**: 3.10.8

`pubspec.yaml`:

```yaml
environment:
  sdk: ^3.10.8
```

---

## What the app does

* Get Started screen
* Avatar gallery (fixed 3-column grid)
* Filters:

  * Gender
  * Age bracket
  * Pose
* Multiple filters can be combined
* Empty state with “Reset filters”
* Full-screen avatar preview (Hero animation)

All data is stored locally in `data/mock/users.dart`.

---

## Architecture

The project is structured in a layered way:

```
lib/
├── data/
│   ├── enums/
│   │   ├── gender.dart
│   │   └── pose.dart
│   ├── mock/
│   │   └── users.dart
│   └── models/
│       ├── user_model.dart
│       └── user_model.g.dart
├── domain/
│   └── entities/
│       └── user_entity.dart
├── presentation/
│   ├── controllers/
│   │   └── app_controller.dart
│   ├── pages/
│   │   ├── get_started_page.dart
│   │   └── home_page.dart
│   ├── utils/
│   │   └── show_filter_popup.dart
│   └── widgets/
│       ├── avatar_card.dart
│       ├── avatar_full_screen.dart
│       ├── filter_chip_button.dart
│       ├── filter_controls.dart
│       ├── max_width.dart
│       └── user_avatars_grid.dart
├── main.dart
└── routes.dart
```

### State management

* **GetX** is used for state and navigation.
* Filtering is done in-memory inside `AppController`.
* Filtered list is computed via a getter (`filteredItems`).

### Age filtering

Age brackets are defined as immutable value objects:

```dart
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
```

---

## Main dependencies

* `get`
* `flutter_screenutil`
* `cached_network_image`
* `json_serializable` (models)

---

## Run locally

```bash
flutter pub get
flutter run
```

---

## Code generation

If you need to regenerate generated files:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## Notes

* No backend.
* No tests (mock data only).
* Filtering logic is fully local.
* Grid is fixed to **3 columns** according to design.
