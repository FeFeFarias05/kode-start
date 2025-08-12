import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
import 'package:ricky_and_morty_challenge/components/app_bar_widget.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';
import 'package:ricky_and_morty_challenge/components/detailed_character_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.character}) : super(key: key);
  
  final Result character; 

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.leftIconColor,
          ),
        ),
        title: 'RICK AND MORTY API',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: DetailedCharacterCard(character: widget.character),
      ),
    );
  }
}

