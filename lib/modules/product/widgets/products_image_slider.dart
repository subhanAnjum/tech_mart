import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_colors.dart';

class ProductsImageSlider extends StatefulWidget {
  final double height;
  const ProductsImageSlider({
    super.key,
    required this.sliderList,
    required this.height,
    this.padding,
    this.margin,
    this.initialWidget,
  });
  final List<String> sliderList;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? initialWidget;

  @override
  State<ProductsImageSlider> createState() => _ProductsImageSliderState();
}

class _ProductsImageSliderState extends State<ProductsImageSlider> {
  PageController sliderPageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;
  late int length;

  @override
  void initState() {
    length = widget.sliderList.length;
    if (widget.initialWidget != null) {
      length++;
    }
    super.initState();
    if (length >= 2) {
      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (_currentPage < length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        sliderPageController.animateToPage(_currentPage,
            duration: Duration(milliseconds: 1500), curve: Curves.easeOutQuart);
      });

      sliderPageController.addListener(() {
        _currentPage = sliderPageController.page!.toInt();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    sliderPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView(
              controller: sliderPageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                if (widget.initialWidget != null)
                  Container(
                      margin: widget.margin,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0.w),
                        color: Colors.white,
                      ),
                      padding: widget.padding,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.w),
                        child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0.w),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    offset: const Offset(0, 2),
                                    blurRadius: 6,
                                    color:
                                        AppColors.shadowColor.withOpacity(0.4))
                              ],
                            ),
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: widget.initialWidget!)),
                      )),
                ...List.generate(
                  widget.sliderList.length,
                  (index) {
                    String data = widget.sliderList[index];
                    return Container(
                      margin: widget.margin,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0.w),
                        color: Colors.white,
                      ),
                      padding: widget.padding,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0.w),
                          image: DecorationImage(
                              image: AssetImage(data), fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0,
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                                color: AppColors.shadowColor.withOpacity(0.4))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]),
        ),
        if (length > 1)
          Positioned(
            bottom: 17.h,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: length,
              position: _currentPage,
              decorator: DotsDecorator(
                size: Size(9.6.w, 8.7.h),
                activeSize: Size(55.2.w, 9.6.h),
                color: AppColors.grey,
                activeColor: AppColors.lightBlack,
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
      ],
    );
  }
}
