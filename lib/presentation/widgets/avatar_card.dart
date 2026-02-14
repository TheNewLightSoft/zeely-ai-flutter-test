import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/data/enums/gender.dart';
import 'package:zeely_ai_test_app/domain/entities/user_entity.dart';
import 'package:zeely_ai_test_app/presentation/widgets/avatar_full_screen.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.user, this.onTap});

  final UserEntity user;
  final VoidCallback? onTap;

  static const double _radius = 8.0;
  static String _heroTag(UserEntity u) {
    return 'avatar:${u.imageLink}';
  }

  static const Border _border = Border.fromBorderSide(
    BorderSide(color: Color(0x0D000000), width: 1),
  );

  static const LinearGradient _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.5, 1.0],
    colors: [Color(0x00000000), Color(0xCC000000)],
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      button: true,
      label: 'Avatar ${user.name}, ${user.gender.label}, age ${user.age}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap:
              onTap ??
              () {
                Get.to(
                  AvatarFullScreen(heroTag: _heroTag(user), user: user),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
          borderRadius: BorderRadius.circular(_radius.r),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius.r),
              border: _border,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_radius.r),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: _heroTag(user),
                      child: _AvatarImage(url: user.imageLink),
                    ),
                  ),

                  const Positioned.fill(
                    child: DecoratedBox(decoration: BoxDecoration(gradient: _gradient)),
                  ),

                  Positioned(
                    left: 8,
                    right: 8,
                    bottom: 8,
                    child: _TextBlock(
                      name: user.name,
                      secondaryLeft: user.gender.label,
                      secondaryRight: '${user.age}',
                      theme: theme,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextBlock extends StatelessWidget {
  const _TextBlock({
    required this.name,
    required this.secondaryLeft,
    required this.secondaryRight,
    required this.theme,
  });

  final String name;
  final String secondaryLeft;
  final String secondaryRight;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final nameStyle = theme.textTheme.titleMedium?.copyWith(
      color: Colors.white,
      height: 1.2,
    );

    final secondaryStyle = theme.textTheme.labelSmall?.copyWith(
      color: Colors.white.withAlpha(200),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: nameStyle),
        const SizedBox(height: 2),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                secondaryLeft,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: secondaryStyle,
              ),
            ),
            const SizedBox(width: 4),
            const _Dot(),
            const SizedBox(width: 4),
            Text(
              secondaryRight,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: secondaryStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 1,
      height: 12,
      child: Center(
        child: SizedBox(
          width: 1,
          height: 1,
          child: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
        ),
      ),
    );
  }
}

class _AvatarImage extends StatelessWidget {
  const _AvatarImage({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      placeholder: (_, _) => const _ImageLoading(),
      errorWidget: (_, _, _) => const _ImageFallback(),
      fadeInDuration: const Duration(milliseconds: 150),
      memCacheWidth: 512,
    );
  }
}

class _ImageLoading extends StatelessWidget {
  const _ImageLoading();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFEFEFEF),
      child: Center(
        child: SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFEFEFEF),
      child: Center(child: Icon(Icons.person, size: 32, color: Color(0xFF999999))),
    );
  }
}
