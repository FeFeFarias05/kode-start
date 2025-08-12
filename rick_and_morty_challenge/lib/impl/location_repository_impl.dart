import 'package:dio/dio.dart';
import 'package:ricky_and_morty_challenge/models/location_list.dart';
import 'package:ricky_and_morty_challenge/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Dio _dio;

  LocationRepositoryImpl(this._dio);

  @override
  Future<LocationListModel> getLocations() async {
    final response = await _dio.get("/location");
    return LocationListModel.fromMap(response.data);
  }
}