import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zeely_ai_test_app/domain/entities/user_entity.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';
import 'package:zeely_ai_test_app/presentation/widgets/avatar_card.dart';

class UserAvatarsGrid extends StatelessWidget {
  const UserAvatarsGrid({super.key, required this.items, this.onResetFilters});

  final List<UserEntity> items;
  final VoidCallback? onResetFilters;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _EmptyResults(onReset: onResetFilters);
    }

    final spec = _GridSpec.phone;

    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: spec.spacing,
        mainAxisSpacing: spec.spacing,
        childAspectRatio: spec.childAspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => AvatarCard(user: items[i]),
    );
  }
}

class _GridSpec {
  const _GridSpec({required this.spacing, required this.childAspectRatio});

  final double spacing;
  final double childAspectRatio;

  static _GridSpec get phone => _GridSpec(spacing: 8.w, childAspectRatio: 112 / 152);
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({this.onReset});

  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 165.w,
              height: 165.w,
              child: Assets.images.bucket.image(fit: BoxFit.contain),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: 252.w,
              child: Text(
                'Nothing was found using these filters',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 24.h),
            _OutlinedPillButton(title: 'Reset filters', onTap: onReset),
          ],
        ),
      ),
    );
  }
}

class _OutlinedPillButton extends StatelessWidget {
  const _OutlinedPillButton({required this.title, required this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 153.w,
      height: 62.h,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFFF2F4F6), width: 1),
          shape: const StadiumBorder(),
          padding: EdgeInsets.zero,
        ),
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
