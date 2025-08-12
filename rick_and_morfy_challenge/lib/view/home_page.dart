import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/theme/app_images.dart';
import 'package:ricky_and_morty_challenge/view/detail_page.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
import 'package:ricky_and_morty_challenge/components/app_bar_widget.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';
import 'package:ricky_and_morty_challenge/components/character_card.dart';
import 'package:ricky_and_morty_challenge/components/search_bar_widget.dart';
import 'package:ricky_and_morty_challenge/core/app_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CharacterListModel>? characters;
  List<Result> allCharacters = [];
  List<Result> filteredCharacters = [];
  String searchUserText = '';

  @override
  void initState() {
    super.initState();
    
    characters = AppDependencies.characterRepository.getCharacters();
    loadCharacters();
  }

  void loadCharacters() async {
    try {
      final characterData = await AppDependencies.characterRepository.getCharacters();
      setState(() {
        allCharacters = characterData.results;
        filteredCharacters = allCharacters;
      });
    } catch (e) {
      print('Error loading characters: $e');
    }
  }

  void filterCharacters(String searchUserText) {
    setState(() {
      this.searchUserText = searchUserText;
      if (searchUserText.isEmpty) {
        filteredCharacters = allCharacters;
      } else {
        filteredCharacters = allCharacters.where((character) {
          return character.name.toLowerCase().contains(searchUserText.toLowerCase());
        }).toList();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        leftIcon: Icon(
          Icons.menu,
          color: AppColors.leftIconColor,
        ),
        title: 'RICK AND MORTY API',
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SearchBarWidget(
            onSearch: filterCharacters,
          ),
          Expanded(
            child: FutureBuilder<CharacterListModel>(
              future: characters,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (filteredCharacters.isEmpty && searchUserText.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 80.0), 
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.emptyState,
                              width: 240,
                              height: 240,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Wubba Lubba Dub Dub!',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'No characters found \n Try searching for another name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.7),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredCharacters.length,
                    itemBuilder: (context, index) {
                      final character = filteredCharacters[index];
                      return CharacterCard(
                        character: character,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(character: character),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "An error occurred: ${snapshot.error}",
                      style: TextStyle(color: AppColors.white),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }




          

}
