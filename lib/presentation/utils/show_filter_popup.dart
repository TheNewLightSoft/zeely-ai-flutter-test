import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zeely_ai_test_app/gen/assets.gen.dart';

Future<List<T>?> showFilterPopup<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T item) itemLabel,
  List<T> initialSelected = const [],
  bool multiSelect = false,
  String saveText = 'Save',
  Widget Function(BuildContext context, T item)? itemContentBuilder,
}) {
  return showModalBottomSheet<List<T>>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withAlpha(127),
    builder: (_) => _FilterPopupCard<T>(
      title: title,
      items: items,
      itemLabel: itemLabel,
      initialSelected: initialSelected,
      multiSelect: multiSelect,
      saveText: saveText,
      itemContentBuilder: itemContentBuilder,
    ),
  );
}

class _FilterPopupCard<T> extends StatefulWidget {
  const _FilterPopupCard({
    required this.title,
    required this.items,
    required this.itemLabel,
    required this.initialSelected,
    required this.multiSelect,
    required this.saveText,
    required this.itemContentBuilder,
  });

  final String title;
  final List<T> items;
  final String Function(T item) itemLabel;
  final List<T> initialSelected;
  final bool multiSelect;
  final String saveText;
  final Widget Function(BuildContext context, T item)? itemContentBuilder;

  @override
  State<_FilterPopupCard<T>> createState() => _FilterPopupCardState<T>();
}

class _FilterPopupCardState<T> extends State<_FilterPopupCard<T>> {
  late final Set<T> _selected = widget.initialSelected.toSet();

  void _toggle(T item) {
    setState(() {
      if (widget.multiSelect) {
        _selected.contains(item) ? _selected.remove(item) : _selected.add(item);
      } else {
        if (_selected.contains(item)) {
          _selected.clear();
        } else {
          _selected
            ..clear()
            ..add(item);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28.r),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 31.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: theme.textTheme.headlineMedium,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: SvgPicture.asset(Assets.svg.close, height: 24.h),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (final item in widget.items) ...[
                          _FilterRow<T>(
                            item: item,
                            isSelected: _selected.contains(item),
                            onTap: () => _toggle(item),
                            content:
                                widget.itemContentBuilder?.call(context, item) ??
                                Text(
                                  widget.itemLabel(item),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 62.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.back(result: _selected.toList(growable: false)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.all(21.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          textStyle: theme.textTheme.titleLarge,
                        ),
                        child: Text(widget.saveText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FilterRow<T> extends StatelessWidget {
  const _FilterRow({
    required this.item,
    required this.isSelected,
    required this.content,
    required this.onTap,
  });

  final T item;
  final bool isSelected;
  final Widget content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: content),
            SizedBox(width: 12.w),
            _CheckBoxPill(selected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _CheckBoxPill extends StatelessWidget {
  const _CheckBoxPill({required this.selected});
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 18.h,
      height: 18.h,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: selected ? Colors.black : const Color(0xFFCAD4DD),
          width: 1,
        ),
      ),
      child: selected ? SvgPicture.asset(Assets.svg.check, height: 12.h) : null,
    );
  }
}
