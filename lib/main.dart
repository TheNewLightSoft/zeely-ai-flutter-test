import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';
import 'package:zeely_ai_test_app/presentation/controllers/app_controller.dart';
import 'package:zeely_ai_test_app/presentation/pages/get_started_page.dart';
import 'package:zeely_ai_test_app/presentation/pages/home_page.dart';
import 'package:zeely_ai_test_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(AppController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => GetMaterialApp(
        title: 'Zeely AI Test App',
        debugShowCheckedModeBanner: false,
        theme: _theme(),
        initialRoute: Routes.init.toString(),
        getPages: [
          GetPage(name: Routes.init, page: () => const GetStartedPage()),
          GetPage(name: Routes.home, page: () => const HomePage()),
        ],
      ),
    );
  }

  ThemeData _theme() => ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Colors.white,

      secondary: Colors.black,
      onSecondary: Colors.white,

      error: Colors.red,
      onError: Colors.white,

      surface: Colors.white,
      onSurface: Colors.black,
    ),

    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.black12,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.transparent,
    ),

    chipTheme: ChipThemeData(
      backgroundColor: Colors.white,
      selectedColor: Colors.white,
      disabledColor: Colors.grey.shade200,
      labelStyle: const TextStyle(color: Colors.black),
      secondaryLabelStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black),
      ),
    ),

    sliderTheme: const SliderThemeData(
      activeTrackColor: Colors.black,
      inactiveTrackColor: Colors.black26,
      thumbColor: Colors.black,
      overlayColor: Colors.black12,
      valueIndicatorColor: Colors.black,
    ),
    fontFamily: Assets.fonts.italianPlateNo2Expanded,
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 64.sp,
        fontWeight: FontWeight.w900,
        height: 1.2,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 0,
      ),
      headlineSmall: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 1.1,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: 1,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.35,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        height: 1.4,
        letterSpacing: 0,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1.4,
        letterSpacing: 0,
      ),
      labelSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1.0,
        letterSpacing: 0,
      ),
    ),
  );
}
