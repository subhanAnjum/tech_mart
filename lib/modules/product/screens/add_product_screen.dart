import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/app_drop_down_button.dart';
import 'package:tech_mart/common/widgets/app_text_field.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/price_selection_input.dart';
import 'package:tech_mart/modules/country/screens/country_screen.dart';
import 'package:tech_mart/modules/product/models/product_option_model.dart';
import 'package:tech_mart/modules/product/widgets/product_options_dialog.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/actions_button.dart';
import '../../../common/widgets/lable_wrapper.dart';
import '../../../utils/app_images.dart';
import '../widgets/add_button.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<ProductOptionModel> productOptions = [
    ProductOptionModel(name: 'Size', options: ['12', '14', '16']),
  ];
  @override
  Widget build(BuildContext context) {
    final actions = [
      const ActionsButton(
        image: AppImages.icNotification,
        isSquared: true,
      ),
      const ActionsButton(
        image: AppImages.icMessages,
        isSquared: true,
      ),
      16.horizontal,
    ];
    final commonHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.w);
    return Scaffold(
      appBar: customAppBar(title: 'Create Product Post', actions: actions),
      body: GestureDetector(
        onTap: () => context.unFocusKeyboard(),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 33.h),
          children: [
            Padding(
              padding: commonHorizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTextField(
                    gradientBorder: false,
                    lable: 'Product Name',
                    bottomText: '60 Characters Maximum',
                    initialValue:
                        'Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                  17.verticalSpace,
                  AppDropDownButton(
                    hintText: '',
                    items: ['Dubai', 'Riyadh', 'Sharjah']
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(color: AppColors.grey),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanges: (p0) {},
                    lable: 'Category',
                    lableStyle: AppTextStyle.mediumBlack16,
                  ),
                  27.verticalSpace,
                  AppDropDownButton(
                    hintText: '',
                    items: ['Dubai', 'Riyadh', 'Sharjah']
                        .map((e) => DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(color: AppColors.grey),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanges: (p0) {},
                    lable: 'Store Category',
                    lableStyle: AppTextStyle.mediumBlack16,
                  ),
                  27.verticalSpace,
                  PriceSelectionInput(
                    lable: 'Product Price',
                    hint: 'Amount',
                    lableStyle: AppTextStyle.mediumBlack16,
                    gradientBorder: false,
                  ),
                  27.verticalSpace,
                  LableWrapper(
                    lable: 'Add Product Images/ Videos',
                    child: AddButton(
                      height: 150.h,
                    ),
                  ),
                  27.verticalSpace,
                  AppDropDownButton(
                    hintText: '',
                    items: [],
                    onChanges: (p0) {},
                    lable: 'Product Condition',
                    lableStyle: AppTextStyle.mediumBlack16,
                  ),
                  27.verticalSpace,
                  const AppTextField(
                    gradientBorder: false,
                    lable: 'Search Tags',
                    bottomText: '5 Tags Maximum - Use Letters & Numbers only',
                  ),
                  17.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      CountryScreen().push(context);
                    },
                    child: AppDropDownButton(
                      hintText: '',
                      items: [],
                      lable: 'Product Display Country',
                      lableStyle: AppTextStyle.mediumBlack16,
                    ),
                  ),
                ],
              ),
            ),
            34.verticalSpace,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.secondary.withOpacity(0.2),
                    AppColors.primary.withOpacity(0.2),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 54.w, vertical: 0.h),
                leading: Image.asset(AppImages.sticky_notes),
                title: Text(
                  'Accurate weight and dimensions are crucial for calculating shipping rates. Double-check your Product measurements to avoid issues.',
                  style: AppTextStyle.mediumBlack12.copyWith(
                    color: AppColors.lightBlack,
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: commonHorizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTextField(
                    gradientBorder: false,
                    lable: 'Product Weight (kg)',
                  ),
                  27.verticalSpace,
                  LableWrapper(
                      lable: 'Product Dimensions (cm)',
                      child: Row(
                        children: [
                          Expanded(
                              child: AppTextField(
                            hint: 'Length',
                            textAlign: TextAlign.center,
                            gradientBorder: false,
                          )),
                          20.horizontalSpace,
                          Expanded(
                              child: AppTextField(
                            hint: 'Width',
                            textAlign: TextAlign.center,
                            gradientBorder: false,
                          )),
                          20.horizontalSpace,
                          Expanded(
                              child: AppTextField(
                            textAlign: TextAlign.center,
                            hint: 'Height',
                            gradientBorder: false,
                          )),
                        ],
                      )),
                  27.verticalSpace,
                  AppTextField(
                    lable: 'Product Description',
                    gradientBorder: false,
                    textInputAction: TextInputAction.done,
                    isExpanded: true,
                    height: 331.h,
                    bottomText: '1000 Characters Maximum',
                  ),
                  17.verticalSpace,
                  LableWrapper(
                    lable: 'Product Selection Options',
                    child: Column(
                      children: [
                        if (productOptions.isNotEmpty) 5.verticalSpace,
                        for (int i = 0; i < productOptions.length; i++)
                          Padding(
                            padding: EdgeInsets.only(bottom: 22.0.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: AppTextField(
                                    fieldStyle: AppTextStyle.mediumBlack14,
                                    textAlign: TextAlign.center,
                                    initialValue: productOptions[i].name,
                                    gradientBorder: false,
                                    isDisabled: true,
                                  ),
                                ),
                                13.horizontalSpace,
                                Expanded(
                                  flex: 3,
                                  child: AppTextField(
                                    fieldStyle: AppTextStyle.mediumBlack14,
                                    textAlign: TextAlign.center,
                                    initialValue:
                                        '${productOptions[i].options.length} Options Added',
                                    gradientBorder: false,
                                    isDisabled: true,
                                  ),
                                ),
                                15.horizontalSpace,
                                InkWell(
                                  onTap: () {
                                    productOptions.removeAt(i);
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    AppImages.ic_delete,
                                    color: AppColors.lightBlack,
                                    height: 20.w,
                                    width: 20.w,
                                  ),
                                ),
                                30.horizontalSpace,
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                    AppImages.ic_edit,
                                    color: AppColors.lightBlack,
                                    height: 20.w,
                                    width: 20.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        AddButton(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ProductOptionsDialog());
                          },
                        ),
                      ],
                    ),
                  ),
                  38.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppButton(
                        borderRadius: BorderRadius.circular(16.w),
                        width: 300.w,
                        height: 62.h,
                        faded: false,
                        onPressed: () {},
                        text: 'Post Product',
                        style: AppTextStyle.mediumBlack18,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
