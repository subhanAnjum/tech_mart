import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_mart/modules/bottom_navigation/screens/bottom_navigation.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.systemColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        fontSizeResolver: (fontSize, instance) {
          return instance.setHeight(fontSize);
        },
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              iconTheme: IconThemeData(size: 20.h),
              primaryIconTheme: IconThemeData(size: 20.h),
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              fontFamily: 'Lato',
              textTheme: GoogleFonts.latoTextTheme()
              // .apply(
              //   fontSizeFactor: 1,
              //   fontFamily: 'Lato',
              //   bodyColor: AppColors.black,
              //   displayColor: AppColors.black,
              // )
              ,
              scaffoldBackgroundColor: AppColors.bgColor,
              appBarTheme: AppBarTheme(
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.blue,
                  titleTextStyle: AppTextStyle.mediumBlack18.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.h,
                  ),
                  surfaceTintColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  iconTheme: const IconThemeData(color: AppColors.black),
                  elevation: 0,
                  scrolledUnderElevation: 0),
              useMaterial3: true,
            ),
            home: const BottomNavigation(),
          );
        });
  }
}
