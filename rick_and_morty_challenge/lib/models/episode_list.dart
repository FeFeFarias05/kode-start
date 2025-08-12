class EpisodeListModel {
  final Info info;
  final List<Result> results;
  EpisodeListModel({
    required this.info,
    required this.results,
  });



  factory EpisodeListModel.fromMap(Map<String, dynamic> map) {
    return EpisodeListModel(
      info: Info.fromMap(map['info'] as Map<String,dynamic>),
      results: List<Result>.from((map['results'] as List<dynamic>).map<Result>((x) => Result.fromMap(x as Map<String,dynamic>),),),
    );
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
  final String air_date;
  final String episode;
  final List<String> characters;
  final String url;
  final String created;
  Result({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });



  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      air_date: map['air_date'] as String,
      episode: map['episode'] as String,
      characters: List<String>.from((map['characters'] as List<dynamic>)),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }



  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      air_date.hashCode ^
      episode.hashCode ^
      characters.hashCode ^
      url.hashCode ^
      created.hashCode;
  }
}