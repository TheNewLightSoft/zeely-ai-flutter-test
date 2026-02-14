import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/domain/entities/user_entity.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';

class AvatarFullScreen extends StatelessWidget {
  const AvatarFullScreen({super.key, required this.heroTag, required this.user});

  final Object heroTag;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            Assets.svg.close,
            height: 24.h,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        actions: [
          Text(
            '${user.age} years • ${user.gender.label}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.white.withAlpha(200)),
          ),
          SizedBox(width: 12.w),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () => Get.back(),
          child: Hero(
            tag: heroTag,
            child: CachedNetworkImage(
              imageUrl: user.imageLink,
              fit: BoxFit.contain,
              filterQuality: FilterQuality.medium,
              width: double.infinity,
              fadeInDuration: Duration.zero,
            ),
          ),
        ),
      ),
    );
  }
}
