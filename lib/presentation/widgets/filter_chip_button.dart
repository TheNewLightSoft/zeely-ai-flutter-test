import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';

class FilterChipButton extends StatelessWidget {
  const FilterChipButton({
    super.key,
    required this.onTap,
    this.text,
    this.counter = 0,
    this.height = 36,
    this.iconOnlySize = 36,
  });

  final VoidCallback? onTap;
  final String? text;
  final int counter;

  final double height;
  final double iconOnlySize;

  bool get isIconOnly => text == null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height.h,
      width: isIconOnly ? iconOnlySize.w : null,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: const Color(0xFFF2F4F6), width: 1),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.r),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isIconOnly ? 6.w : 12.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isIconOnly) ...[
                  SvgPicture.asset(Assets.svg.close, height: 24.h),
                ] else ...[
                  Text(
                    text!,
                    style: theme.textTheme.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 8.w),

                  if (counter > 0) _CounterBadge(value: counter),

                  SizedBox(width: 10.w),
                  SvgPicture.asset(Assets.svg.chevronDown, height: 12.h),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CounterBadge extends StatelessWidget {
  const _CounterBadge({required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      width: 16.w,
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        '$value',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
      ),
    );
  }
}
