import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/models/reaction_to_text_model.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/helper.dart';

extension ScreenUtils on BuildContext {
  EdgeInsets get screenInsets {
    return MediaQuery.of(this).viewPadding;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }

  void unFocusKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

extension NavigationUtils on Widget {
  Future push(BuildContext context) async {
    return Navigator.of(context).push(Helper.createRoute(this));
  }
}

extension NavigationHelper on BuildContext {
  Future pop([result]) async {
    return Navigator.of(this).pop(result);
  }
}

extension SpacerUtils on num {
  Widget get vertical {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get horizontal {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget get gap {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }
}

extension ResponsiveStyle on TextStyle {
  TextStyle get responsive {
    return copyWith(fontSize: fontSize?.sp);
  }

  TextStyle get resp {
    return this;
  }
}

extension ConvertToText on Reaction<int> {
  ReactionToTextModel get convertToText {
    final value = this.value;
    String text = '';
    TextStyle style = AppTextStyle.boldBlack14.responsive;
    switch (value) {
      case 0:
        {
          text = 'Like';
          style = style.copyWith(color: AppColors.lightBlue);
        }
        break;
      case 1:
        {
          text = 'Heart';
          style = style.copyWith(color: Colors.red.shade400);
        }
        break;
      case 2:
        {
          text = 'Care';
          style = style.copyWith(color: AppColors.secondary);
        }
        break;
      case 3:
        {
          text = 'Laugh';
          style = style.copyWith(color: AppColors.secondary);
        }
        break;
      case 4:
        {
          text = 'Wow';
          style = style.copyWith(color: AppColors.secondary);
        }
        break;
      case 5:
        {
          text = 'Sad';
          style = style.copyWith(color: AppColors.secondary);
        }
        break;
      case 6:
        {
          text = 'Angry';
          style = style.copyWith(color: Colors.red);
        }
        break;
    }

    return ReactionToTextModel(text, style);
  }
}
