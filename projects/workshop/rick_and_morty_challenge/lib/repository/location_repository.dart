import 'package:ricky_and_morty_challenge/models/location_list.dart';

abstract class LocationRepository {
  Future<LocationListModel> getLocations();
}