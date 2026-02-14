import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';
import 'package:zeely_ai_test_app/routes.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F6),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60.w, vertical: 100.h),
              alignment: Alignment.topCenter,
              child: Assets.images.logo.image(fit: BoxFit.contain),
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.35, 1.0],
                      colors: [
                        const Color(0xFFF2F4F6).withAlpha(0),
                        const Color(0xFFF2F4F6),
                        const Color(0xFFF2F4F6),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 240.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Zeely AI',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Text(
                      'Flutter Test App',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 63.h,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFCAD4DD),
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.home);
                  },
                  child: Text(
                    'Get started',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
