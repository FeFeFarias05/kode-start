import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/view/detail_page.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
import 'package:ricky_and_morty_challenge/components/app_bar_widget.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';
import 'package:ricky_and_morty_challenge/components/character_card.dart';
import 'package:ricky_and_morty_challenge/core/app_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<CharacterListModel>? characters;

  @override
  void initState() {
    super.initState();
    
    characters = AppDependencies.characterRepository.getCharacters();
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
      body: FutureBuilder<CharacterListModel>(
        future: characters,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;

            if (data == null) {
              return Text(
                'Sem personagens',
                style: TextStyle(color: AppColors.white),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 7.5),
              itemCount: data.results.length,
              itemBuilder: (context, index) {
                final character = data.results[index];
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
                "Ocorreu um erro: ${snapshot.error}",
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }




          

}

// import 'package:flutter/material.dart';
// import 'package:ricky_and_morty_challenge/view/detail_page.dart';
// import 'package:ricky_and_morty_challenge/theme/app_colors.dart';
// import 'package:ricky_and_morty_challenge/components/app_bar_widget.dart';
// import 'package:ricky_and_morty_challenge/models/character_list.dart';
// import 'package:ricky_and_morty_challenge/components/character_card.dart';
// import 'package:ricky_and_morty_challenge/core/app_dependencies.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Future<CharacterListModel>? characters;
//   final TextEditingController _searchController = TextEditingController();
//   CharacterListModel? _allCharacters;
//   List<Result> _filteredCharacters = [];

//   @override
//   void initState() {
//     super.initState();
    
//     characters = AppDependencies.characterRepository.getCharacters();
//     _loadCharacters();
//   }

//   void _loadCharacters() async {
//     try {
//       final result = await AppDependencies.characterRepository.getCharacters();
//       setState(() {
//         _allCharacters = result;
//         _filteredCharacters = result.results;
//       });
//     } catch (e) {
//       // Handle error
//     }
//   }

//   void _filterCharacters(String query) {
//     if (_allCharacters == null) return;

//     setState(() {
//       if (query.isEmpty) {
//         _filteredCharacters = _allCharacters!.results;
//       } else {
//         _filteredCharacters = _allCharacters!.results.where((character) {
//           return character.name.toLowerCase().contains(query.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWidget(
//         leftIcon: Icon(
//           Icons.menu,
//           color: AppColors.leftIconColor,
//         ),
//         title: 'RICK AND MORTY API',
//       ),
//       backgroundColor: AppColors.backgroundColor,
//       body: Column(
//         children: [
//           // SearchBar
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             decoration: BoxDecoration(
//               color: AppColors.cardDecriptionColor,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 _filterCharacters(value);
//                 setState(() {}); // Para atualizar o ícone clear
//               },
//               style: TextStyle(color: AppColors.white),
//               decoration: InputDecoration(
//                 hintText: 'Search characters by name...',
//                 hintStyle: TextStyle(
//                   color: AppColors.white.withOpacity(0.6),
//                   fontSize: 16,
//                 ),
//                 prefixIcon: Icon(
//                   Icons.search,
//                   color: AppColors.white.withOpacity(0.7),
//                 ),
//                 suffixIcon: _searchController.text.isNotEmpty
//                     ? IconButton(
//                         icon: Icon(
//                           Icons.clear,
//                           color: AppColors.white.withOpacity(0.7),
//                         ),
//                         onPressed: () {
//                           _searchController.clear();
//                           _filterCharacters('');
//                         },
//                       )
//                     : null,
//                 border: InputBorder.none,
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 16,
//                 ),
//               ),
//             ),
//           ),
//           // Characters List
//           Expanded(
//             child: _allCharacters == null
//                 ? const Center(child: CircularProgressIndicator())
//                 : _filteredCharacters.isEmpty
//                     ? Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.search_off,
//                               size: 64,
//                               color: AppColors.white.withOpacity(0.5),
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'No characters found',
//                               style: TextStyle(
//                                 color: AppColors.white.withOpacity(0.7),
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               'Try searching with a different name',
//                               style: TextStyle(
//                                 color: AppColors.white.withOpacity(0.5),
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListView.builder(
//                         padding: const EdgeInsets.symmetric(vertical: 7.5),
//                         itemCount: _filteredCharacters.length,
//                         itemBuilder: (context, index) {
//                           final character = _filteredCharacters[index];
//                           return CharacterCard(
//                             character: character,
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DetailPage(character: character),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//           ),
//         ],
//       ),
//     );
//   }



// }