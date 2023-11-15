import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/modules/product/widgets/reaction_user_list_tile.dart';

class ReactionListView extends StatelessWidget {
  const ReactionListView({
    super.key,
    required this.children,
  });
  final List<ReactionUserListTile> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 22.h),
      children: children,
    );
  }
}
