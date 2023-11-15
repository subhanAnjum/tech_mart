import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';
import 'package:tech_mart/utils/globals.dart';

import '../../../common/widgets/price_drop_down.dart';
import '../widgets/filter_switch_tile.dart';
import '../widgets/filter_tile.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool isSwithc = false;
  final _focusNodePrice = FocusNode();
  @override
  void initState() {
    _focusNodePrice.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    onChanged(value) {
      setState(() {
        isSwithc = value;
      });
    }

    return Drawer(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      width: 275.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.h),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlueBlackShaderMask(
                  child: Text(
                    'Filter',
                    style: AppTextStyle.mediumBlack16.responsive,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4)),
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: AppColors.lightBlue).responsive,
                    )),
              ],
            ),
          ),
          FilterTile(
            title: 'Sort',
            options: const [
              'Most Recent',
              'Price - Lowest to Highest',
              'Price - Highest to Lowest'
            ],
            onSelection: (p0) {},
          ),
          FilterTile(
            selectedValue: 'Most Recent',
            title: 'Condition',
            options: const [
              'Most Recent',
              'Price - Lowest to Highest',
              'Price - Highest to Lowest'
            ],
            onSelection: (p0) {},
          ),
          FilterTile(
            title: 'Category',
            options: const [
              'Most Recent',
              'Price - Lowest to Highest',
              'Price - Highest to Lowest'
            ],
            onSelection: (p0) {},
          ),
          FilterTile(
            title: 'Store',
            options: const [
              'Most Recent',
              'Price - Lowest to Highest',
              'Price - Highest to Lowest'
            ],
            onSelection: (p0) {},
          ),
          FilterTile(
            title: 'Price',
            options: [],
            onSelection: (p0) {},
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0.w,
                    right: 15.w,
                    bottom: _focusNodePrice.hasFocus ? 140.h : 0),
                child: DropdownButton2<String>(
                    focusNode: _focusNodePrice,
                    isExpanded: true,
                    value: 'QAR',
                    dropdownStyleData: DropdownStyleData(
                      elevation: 0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.w),
                      ),
                    ),
                    style: AppTextStyle.mediumGrey14
                        .copyWith(color: AppColors.lightGrey)
                        .responsive,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'QAR',
                          style: TextStyle(fontSize: 12).responsive,
                        ),
                        value: 'QAR',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'PKR',
                          style: TextStyle(fontSize: 12).responsive,
                        ),
                        value: 'PKR',
                      ),
                      DropdownMenuItem(
                        child: Text('USD',
                            style: TextStyle(fontSize: 12).responsive),
                        value: 'USD',
                      ),
                    ],
                    onChanged: (value) {}),
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: PriceDropDown(
                        lable: 'Min. Price',
                        selectedValue: '100',
                        options: ['No Max', '100', '200'],
                        onChanged: (p0) {},
                      ),
                    )
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: PriceDropDown(
                        lable: 'Max. Price',
                        selectedValue: '100',
                        options: ['No Max', '100', '200'],
                        onChanged: (p0) {},
                      ),
                    )
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Return Accepted',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Completed Items',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Sold Items',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Deals & Savings',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Accept Video Call',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Accept Audio Call',
            onChanged: onChanged,
          ),
          FilterSwitchTile(
            isSwithc: isSwithc,
            text: 'Whatsapp',
            onChanged: onChanged,
          ),
          50.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                onPressed: () {
                  globalScaffoldKey.currentState!.closeEndDrawer();
                },
                faded: false,
                text: 'Done',
                height: 62.h,
                width: 229.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
