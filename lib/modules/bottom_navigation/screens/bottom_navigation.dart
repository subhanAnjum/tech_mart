import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:tech_mart/modules/filters/screens/filter_view.dart';
import 'package:tech_mart/modules/home/screens/home_screen.dart';
import 'package:tech_mart/modules/search/screens/search_screen.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';
import 'package:tech_mart/utils/globals.dart';

import '../widgets/bottom_navigation_item.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final screens = [HomeScreen(), SearchScreen(), Scaffold(), Scaffold()];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.systemColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          key: globalScaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          endDrawer: FilterView(),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              screens[_selectedIndex],
              //bottom_bar
              Positioned(
                bottom: Platform.isAndroid ? -3 : null,
                child: Container(
                  height: 80,
                  width: context.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.bottomRectangle,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(children: [
                    (context.width * 0.05).horizontal,
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomNavigationItem(
                          isSelected: _selectedIndex == 0,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 0;
                            });
                          },
                          iconPath: AppImages.icHome,
                        ),
                        BottomNavigationItem(
                          isSelected: _selectedIndex == 1,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          iconPath: AppImages.icSearch,
                        ),
                      ],
                    )),
                    const Expanded(child: Row()),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomNavigationItem(
                          isSelected: _selectedIndex == 2,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 2;
                            });
                          },
                          iconPath: AppImages.icCart,
                        ),
                        BottomNavigationItem(
                          isSelected: _selectedIndex == 3,
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                          iconPath: AppImages.icProfile,
                        ),
                      ],
                    )),
                    (context.width * 0.05).horizontal,
                  ]),
                ),
              ),

              //floating button
              Container(
                height: 70,
                width: 70,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    bottom: 50 - (Platform.isAndroid ? 3 : 0.0), right: 2),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.secondary, AppColors.primary],
                    )),
                child: Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(500.0),
                    highlightColor: AppColors.primary,
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black,
                      ),
                      child: Image.asset(
                        AppImages.crownGroup,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
