import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/dialogs/upgrade_premium_dialog.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/search_text_field.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';

import '../../../common/widgets/country_tile.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    EdgeInsets? padding = EdgeInsets.symmetric(horizontal: 10.w);
    const imagePath = AppImages.buggati;
    const isPremium = true;
    const title = 'Worldwide';
    String? trailing = '+1';
    return Scaffold(
      appBar: customAppBar(title: 'Select Country'),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        children: [
          Padding(
            padding: padding,
            child: SearchTextField(
              withFilter: false,
            ),
          ),
          18.verticalSpace,
          CountryTile(
              padding: padding,
              imagePath: imagePath,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => const UpgradePremiumDialog());
              },
              title: title,
              isPremium: isPremium,
              trailing: trailing),
          20.verticalSpace,
          const Divider(
            color: AppColors.grey,
          ),
          20.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            padding: padding,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (_, index) => CountryTile(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              imagePath: imagePath,
              isSelected: isSelected,
              title: 'Canada',
              trailing: '+1',
            ),
            separatorBuilder: (BuildContext context, int index) {
              return 20.verticalSpace;
            },
          )
        ],
      ),
    );
  }
}
