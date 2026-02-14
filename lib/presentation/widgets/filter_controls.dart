import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/data/enums/pose.dart';
import 'package:zeely_ai_test_app/presentation/controllers/app_controller.dart';
import 'package:zeely_ai_test_app/presentation/utils/show_filter_popup.dart';
import 'package:zeely_ai_test_app/presentation/widgets/filter_chip_button.dart';

class FilterControls extends StatelessWidget {
  const FilterControls({super.key, required this.controller});
  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final hasFilters = controller.hasFilters;

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            if (hasFilters) ...[
              FilterChipButton(onTap: controller.clearFilters),
              SizedBox(width: 12.w),
            ],
            FilterChipButton(
              text: 'Gender',
              counter: controller.selectedGenders.length,
              onTap: () async {
                final result = await showFilterPopup<Gender>(
                  context: context,
                  title: 'Gender',
                  items: const [Gender.male, Gender.female],
                  itemLabel: (g) => g.label,
                  initialSelected: controller.selectedGenders.toList(growable: false),
                  multiSelect: true,
                );
                if (result != null) {
                  controller.setGendersFilter(result);
                }
              },
            ),
            SizedBox(width: 12.w),
            FilterChipButton(
              text: 'Age',
              counter: controller.selectedAgeBrackets.length,
              onTap: () async {
                final result = await showFilterPopup<AgeBracket>(
                  context: context,
                  title: 'Age',
                  items: ageBrackets,
                  itemContentBuilder: (context, b) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                        child: Text(
                          b.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                        child: Text(
                          b.subtitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  itemLabel: (_) => '',
                  initialSelected: controller.selectedAgeBrackets.toList(growable: false),
                  multiSelect: true,
                );
                if (result != null) {
                  controller.setAgeBracketsFilter(result);
                }
              },
            ),
            SizedBox(width: 12.w),
            FilterChipButton(
              text: 'Pose',
              counter: controller.selectedPoses.length,
              onTap: () async {
                final result = await showFilterPopup<Pose>(
                  context: context,
                  title: 'Pose',
                  items: Pose.values,
                  itemLabel: (p) => p.label,
                  initialSelected: controller.selectedPoses.toList(growable: false),
                  multiSelect: true,
                );
                if (result != null) {
                  controller.setPosesFilter(result);
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
