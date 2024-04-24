import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class TitleReservation extends StatelessWidget {
  const TitleReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 59.h),
      //? Arrow And Text :
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                RouteNamedScreens.homeScreenNameRoute,
              );
              context.read<ButtonNavCubit>().changeIndexButtonNav(2, context);
            },
            child: SvgPicture.asset(
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          TextUtiels(
            paddingRight: 16.w,
            text: AppWordManger.myReservation,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
        ],
      ),
    );
  }
}
