import 'package:ricky_and_morty_challenge/models/character_list.dart';

abstract class CharacterRepository {
  Future<CharacterListModel> getCharacters();
}