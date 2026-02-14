# Zeely AI Test App

A Flutter test application showcasing clean architecture principles and modern UI design patterns. This project demonstrates a well-structured Flutter application with state management, data modeling, and responsive design.

## 📋 Overview

This test application presents a gallery of user avatars with advanced filtering capabilities. Users can browse through a collection of avatars and filter them by gender, pose, and age brackets. The app features a clean, modern interface with smooth transitions and intuitive navigation.

## 🏗️ Architecture

The application follows clean architecture principles with clear separation of concerns:

### Domain Layer
- **Entities**: Core business models (`UserEntity`)
- **Use Cases**: Business logic and rules

### Data Layer
- **Models**: Data transfer objects (`UserModel`)
- **Enums**: Type-safe constants (`Gender`, `Pose`)
- **Mock Data**: Sample data for demonstration

### Presentation Layer
- **Controllers**: State management using GetX (`AppController`)
- **Pages**: Screen-level widgets (`GetStartedPage`, `HomePage`)
- **Widgets**: Reusable UI components
- **Utils**: Helper functions and utilities

## 🎨 Features

### Core Functionality
- **Avatar Gallery**: Browse through a collection of user avatars
- **Advanced Filtering**: Filter avatars by multiple criteria:
  - Gender (Male/Female)
  - Pose (Standing, Sitting, Selfie, Car Selfie, Walking)
  - Age Brackets (Young adults, Adults, Middle-aged adults, Older adults)
- **Full-Screen View**: Tap any avatar to view it in full screen
- **Filter Management**: Clear all filters with a single action

### UI/UX Features
- **Responsive Design**: Optimized for various screen sizes
- **Smooth Transitions**: Fluid navigation between screens
- **Modern Typography**: Custom font with consistent text hierarchy
- **Accessibility**: Proper contrast ratios and touch targets

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.10.8 or later)
- Dart SDK (version 3.10.8 or later)
- Android Studio or VS Code with Flutter extension

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/TheNewLightSoft/zeely-ai-flutter-test.git
   cd zeely_ai_test_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web
```

## 📱 Screenshots

### Get Started Screen
The application opens with a clean welcome screen featuring the Zeely AI logo and a prominent "Get Started" button.

### Home Screen
The main gallery view displays avatars in a responsive grid layout with filtering controls at the top.

### Filter Controls
Users can apply multiple filters simultaneously:
- Gender chips for Male/Female selection
- Pose chips for different avatar poses
- Age bracket selection with clear age ranges

### Full-Screen Avatar View
Tapping an avatar opens a full-screen modal with the avatar image and user information.

## 📁 Project Structure

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

## 🔧 Dependencies

### Core Dependencies
- **GetX**: State management and navigation
- **flutter_screenutil**: Responsive design utilities
- **flutter_svg**: SVG image support
- **cached_network_image**: Image caching and loading

### Development Dependencies
- **json_serializable**: Code generation for JSON serialization
- **build_runner**: Build automation
- **flutter_gen_runner**: Asset code generation

## 🎯 Key Design Patterns

### State Management
- **GetX Pattern**: Simple and efficient state management
- **Reactive Programming**: Real-time UI updates based on state changes
- **Controller Pattern**: Separation of business logic from UI

### Data Flow
- **Unidirectional Data Flow**: Clear data flow from data layer to presentation
- **Immutable State**: State changes create new instances
- **Filter Logic**: Complex filtering with multiple criteria

### UI Architecture
- **Widget Composition**: Reusable and composable widgets
- **Responsive Design**: Adapts to different screen sizes
- **Consistent Styling**: Centralized theme and typography

## 🧪 Testing

The project includes widget tests for UI components:

```bash
flutter test
```

## 📝 Code Generation

This project uses code generation for:
- JSON serialization (`user_model.g.dart`)
- Asset references (`assets.gen.dart`, `fonts.gen.dart`)

To regenerate code:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **RandomUser API**: For providing sample avatar images
- **Flutter Team**: For the excellent Flutter framework
- **GetX Team**: For powerful state management solution

## 📞 Contact

For questions or support, please reach out through the project repository.

---

**Built with ❤️ using Flutter**