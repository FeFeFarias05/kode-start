import 'package:dio/dio.dart';
import 'package:ricky_and_morty_challenge/repository/episode_repository.dart';
import 'package:ricky_and_morty_challenge/models/episode_list.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final Dio _dio;

  EpisodeRepositoryImpl(this._dio);

  @override
  Future<EpisodeListModel> getEpisodes() async {
    final response = await _dio.get("/episode");
    return EpisodeListModel.fromMap(response.data);
  }

  @override
  Future<Result> getEpisodeById(int id) async {
    final response = await _dio.get("/episode/$id");
    return Result.fromMap(response.data);
  }

  @override
  int extractEpisodeId(String episodeUrl) {
    return int.parse(episodeUrl.split('/').last);
  }
}