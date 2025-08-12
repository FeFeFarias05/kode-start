import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, required this.onTap, Key? key})
      : super(key: key);

  final Result character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDescriptionColor,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              character.image,
              height: 120, //160 - 40 
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
