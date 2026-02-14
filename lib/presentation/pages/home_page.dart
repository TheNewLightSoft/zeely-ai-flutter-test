import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';
import 'package:zeely_ai_test_app/presentation/controllers/app_controller.dart';
import 'package:zeely_ai_test_app/presentation/widgets/filter_controls.dart';
import 'package:zeely_ai_test_app/presentation/widgets/max_width.dart';
import 'package:zeely_ai_test_app/presentation/widgets/user_avatars_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(Assets.svg.chevronLeft, height: 24.h),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Text('All Avatars', style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 12.h),
              FilterControls(controller: appController),
              SizedBox(height: 12.h),
              Expanded(
                child: MaxWidth(
                  max: 560,
                  child: Obx(
                    () => UserAvatarsGrid(
                      items: appController.filteredItems,
                      onResetFilters: appController.clearFilters,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
