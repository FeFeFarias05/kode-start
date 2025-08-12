import 'package:dio/dio.dart';
import 'package:ricky_and_morty_challenge/models/character_list.dart';
import 'package:ricky_and_morty_challenge/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final Dio _dio;

  CharacterRepositoryImpl(this._dio);

  @override
  Future<CharacterListModel> getCharacters() async {
    final response = await _dio.get('/character');
    return CharacterListModel.fromMap(response.data);
  }
}