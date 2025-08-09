import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.leftIcon,
    required this.rightIcon,
    this.title = 'RICK AND MORTY API',
  }) : super(key: key);

  final Widget leftIcon;
  final Widget rightIcon;
  final String title; 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
            left: 15,
            top: 22,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftIcon,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 21,
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png'),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              rightIcon,
            ],
          ),
        ),  
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160); 
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