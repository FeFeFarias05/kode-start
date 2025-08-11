import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.leftIcon,
    this.title = 'RICK AND MORTY API',
  }) : super(key: key);

  final Widget leftIcon;
  final String title; 

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2.2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarBackground,
      height: kToolbarHeight * 2.2, // ← Aqui você usa o cálculo
      child: SafeArea(
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
                    Image.asset('assets/logo.png'),
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
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                Icons.person,
                color: AppColors.rightIconColor,
              ),
            ),
          ],
        ),  
      ),
    );
  }


}


// child: Padding(
//           padding: const EdgeInsets.only(
//             right: 15,
//             left: 15,
//             top: 10,
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               leftIcon,
//               Expanded(
//                 child: Column(
//                   children: [
//                     Image.asset('assets/logo.png'),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text(
//                         'CALCULADORA DE IMC',
//                         style: TextStyle(
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Icon(
//                 Icons.menu,
//                 color: AppColors.white,
//               ),
//             ],
//           ),
//         // ),