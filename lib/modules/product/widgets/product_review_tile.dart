import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';

class ProductReviewTile extends StatefulWidget {
  const ProductReviewTile({
    super.key,
    this.padding,
    required this.name,
    required this.rating,
    required this.review,
    required this.date,
  });

  final EdgeInsets? padding;
  final String name;
  final double rating;
  final String review;
  final String date;

  @override
  State<ProductReviewTile> createState() => _ProductReviewTileState();
}

class _ProductReviewTileState extends State<ProductReviewTile> {
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlueBlackShaderMask(
            child: Text(
          widget.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.mediumBlack16.responsive,
        )),
        RatingBar.builder(
          initialRating: widget.rating,
          glow: false,
          glowRadius: 0,
          itemSize: 14.w,
          ignoreGestures: true,
          glowColor: AppColors.secondary.withOpacity(0.1),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          unratedColor: AppColors.secondary.withAlpha(150),
          itemBuilder: (context, _) => Icon(
            Icons.star_rounded,
            size: 14.w,
            color: AppColors.primary,
          ),
          onRatingUpdate: (rating) {},
        ),
        5.verticalSpace,
        BlueBlackShaderMask(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                style: TextStyle(fontSize: 14).responsive,
                text: isMore
                    ? widget.review
                    : widget.review.length > 120
                        ? '${widget.review.substring(0, 120)}...'
                        : widget.review,
              ),
              if (widget.review.length > 120)
                WidgetSpan(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMore = !isMore;
                    });
                  },
                  child: Text(
                    !isMore ? ' More' : ' Less',
                    style: const TextStyle(
                            fontSize: 14, color: AppColors.black, height: 1.22)
                        .responsive,
                  ),
                ))
            ]),
          ),
        ),
        5.verticalSpace,
        BlueBlackShaderMask(
          child: Text(
            widget.date,
            style: AppTextStyle.regularGrey12.responsive.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ]),
    );
  }
}
