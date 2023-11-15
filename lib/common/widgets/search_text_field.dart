import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_textstyle.dart';

// ignore: must_be_immutable
class SearchTextField extends StatefulWidget {
  SearchTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onTapFilter,
    this.padding,
    this.onTapProduct,
    this.onTapStore,
    this.onFocusChange,
    this.withOverlay = false,
    this.withFilter = true,
  });
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback? onTapFilter;
  final VoidCallback? onTapProduct;
  final VoidCallback? onTapStore;
  EdgeInsets? padding;
  final Function(bool)? onFocusChange;
  final bool withOverlay;
  final bool withFilter;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    if (widget.withOverlay) {
      _focusNode.addListener(() {
        if (widget.onFocusChange != null) {
          widget.onFocusChange!(_focusNode.hasFocus);
        }
        if (_focusNode.hasFocus) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry);
        } else {
          _overlayEntry.remove();
        }
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.withOverlay) {
      _focusNode.removeListener(() {
        if (widget.onFocusChange != null) {
          widget.onFocusChange!(_focusNode.hasFocus);
        }
      });
    }
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 12.0.h,
              width: size.width,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: widget.padding?.left.w ?? 0),
                  width: size.width,
                  height: 78.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.white),
                  child: Row(children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        widget.onTapProduct != null
                            ? widget.onTapProduct!()
                            : null;
                        FocusScope.of(context).unfocus();
                      },
                      child: Center(
                        child: Text(
                          'Product',
                          style: AppTextStyle.mediumBlack12
                              .copyWith(color: AppColors.blue, fontSize: 12.h),
                        ),
                      ),
                    )),
                    Container(
                      width: 1,
                      color: AppColors.black,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        widget.onTapStore != null ? widget.onTapStore!() : null;
                        FocusScope.of(context).unfocus();
                      },
                      child: Center(
                        child: Text('User/Store',
                            style: AppTextStyle.mediumBlack12.responsive
                                .copyWith(color: AppColors.blue)),
                      ),
                    )),
                  ]),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    widget.padding ??= EdgeInsets.zero;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      margin: widget.padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      child: Row(
        children: [
          Image(
            image: const AssetImage(AppImages.icSearch),
            height: 16.h,
            width: 16.w,
            color: AppColors.blue,
          ),
          Expanded(
              child: TextFormField(
            controller: widget.controller,
            style: AppTextStyle.regularBlack14
                .copyWith(color: AppColors.blue, fontSize: 14.h),
            focusNode: _focusNode,
            textAlignVertical: TextAlignVertical.top,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: widget.hintText ?? 'Search',
              hintStyle:
                  AppTextStyle.regularBlack14.copyWith(color: AppColors.blue),
              contentPadding: EdgeInsets.only(
                  right: 5.0.w, left: 15.0.w, top: 10.h, bottom: 10.h),
            ),
          )),
          if (widget.withFilter)
            Row(
              children: [
                Container(
                  color: AppColors.lightGrey,
                  height: 24.h,
                  width: 1.w,
                ),
                20.horizontal,
                GestureDetector(
                  onTap: widget.onTapFilter,
                  child: Container(
                    height: 16.w,
                    width: 16.w,
                    child: Image(
                      image: const AssetImage(
                        AppImages.icFilter,
                      ),
                      height: 16.w,
                      width: 16.w,
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
