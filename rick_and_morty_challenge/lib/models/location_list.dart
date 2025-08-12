import 'package:collection/collection.dart';

class LocationListModel {
  final Info info;
  final List<Result> results;
  LocationListModel({
    required this.info,
    required this.results,
  });

  factory LocationListModel.fromMap(Map<String, dynamic> map) {
    return LocationListModel(
      info: Info.fromMap(map['info'] as Map<String,dynamic>),
      results: List<Result>.from((map['results'] as List<dynamic>).map<Result>((x) => Result.fromMap(x as Map<String,dynamic>),),),
    );
  }


  @override
  bool operator ==(covariant LocationListModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.info == info &&
      listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}

class Info {
  final int count;
  final int pages;
  final String next;
  final Prev prev;
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      count: map['count'].toInt() as int,
      pages: map['pages'].toInt() as int,
      next: map['next'] as String,
      prev: map['prev'] != null ? Prev.fromMap(map['prev'] as Map<String,dynamic>) : Prev(),
    );
  }


  @override
  int get hashCode {
    return count.hashCode ^
      pages.hashCode ^
      next.hashCode ^
      prev.hashCode;
  }
}

class Prev {
  Prev();

  factory Prev.fromMap(Map<String, dynamic>? map) {
    return Prev();
  }
}

class Result {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;
  Result({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      type: map['type'] as String,
      dimension: map['dimension'] as String,
      residents: List<String>.from((map['residents'] as List<dynamic>)),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }


  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      dimension.hashCode ^
      residents.hashCode ^
      url.hashCode ^
      created.hashCode;
  }
}