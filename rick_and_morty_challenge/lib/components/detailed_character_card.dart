import 'package:flutter/material.dart';
import 'package:ricky_and_morty_challenge/core/app_dependencies.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';
import 'package:ricky_and_morty_challenge/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({required this.character, Key? key})
      : super(key: key);

  final Result character;
  

  Color getStatusColor(String status) {
    if (status.toLowerCase() == 'alive') {
      return Colors.green;
    } else if (status.toLowerCase() == 'dead') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Future<String> getFirstEpisodeName() async {
    if (character.episode.isEmpty) return 'Unknown';
    
    
    try {
      final firstEpisodeUrl = character.episode.first;
      final episodeId = AppDependencies.episodeRepository.extractEpisodeId(firstEpisodeUrl);
      final episode = await AppDependencies.episodeRepository.getEpisodeById(episodeId);
      return episode.name;
    } catch (e) {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardDescriptionColor,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
  
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.network(
              character.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.fitWidth, 
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              character.name.toUpperCase(),
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                fontSize: 14.5,
              ),
            ),
          ),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 38, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, spacing: 15,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: getStatusColor(character.status),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${character.status} - ${character.species}',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Gender:', 
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300, 
                        ),
                      ),
                      Text(
                        character.gender,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Origin:', 
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300, 
                        ),
                      ),
                      Text(
                        character.origin.name,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ],
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'Last known location:', 
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300, 
                        ),
                      ),
                      Text(
                        character.location.name,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500, 
                        ),
                      ),
                    ],
                  ),
                  
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        'First seen in:', 
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w300, 
                        ),
                      ),
                      FutureBuilder<String>(
                        future: getFirstEpisodeName(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data!,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500, 
                              ),
                            );
                          }
                          if (snapshot.hasError) {
                            return Text(
                              'Error loading episode',
                              style: TextStyle(
                                color: AppColors.white.withOpacity(0.5),
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500, 
                              ),
                            );
                          }
                          return SizedBox(
                            height: 12.5,
                            width: 12.5,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

     ],
    ),);
  }

  
  }

 


