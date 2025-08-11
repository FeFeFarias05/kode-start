import 'package:ricky_and_morty_challenge/models/episode_list.dart';

abstract class EpisodeRepository {
  Future<EpisodeListModel> getEpisodes();
  Future<Result> getEpisodeById(int id);
  int extractEpisodeId(String episodeUrl);
}