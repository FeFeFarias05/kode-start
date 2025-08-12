import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
import 'package:ricky_and_morty_challenge/theme/app_images.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.leftIcon,
    this.title = 'RICK AND MORTY API',
  }) : super(key: key);

  final Widget leftIcon;
  final String title; 

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2.2 + 50); // Adding extra space for iOS safe area

  @override
  Widget build(BuildContext context) {

    final topPadding = MediaQuery.of(context).padding.top; //extra space for ios 
    
    return Container(
      color: AppColors.appBarBackground,
      height: kToolbarHeight * 2.2 + topPadding,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: leftIcon,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(

                  children: [
                    Image.asset(AppImages.logo),
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                AppImages.person,
                width: 26,
                height: 26,
                color: AppColors.rightIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }


}


