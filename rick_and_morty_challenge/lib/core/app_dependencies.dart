import 'package:dio/dio.dart';
import 'package:ricky_and_morty_challenge/impl/character_repository_impl.dart';
import 'package:ricky_and_morty_challenge/impl/episode_repository_impl.dart';
import 'package:ricky_and_morty_challenge/impl/location_repository_impl.dart';

class AppDependencies {
  AppDependencies._();

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://rickandmortyapi.com/api',
  ));

  static final CharacterRepositoryImpl characterRepository = CharacterRepositoryImpl(_dio);

  static final EpisodeRepositoryImpl episodeRepository = EpisodeRepositoryImpl(_dio);  

  static final LocationRepositoryImpl locationRepository = LocationRepositoryImpl(_dio);
}
