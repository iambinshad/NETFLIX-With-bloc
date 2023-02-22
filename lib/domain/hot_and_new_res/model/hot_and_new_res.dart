import 'package:json_annotation/json_annotation.dart';

part 'hot_and_new_res.g.dart';

@JsonSerializable()
class HotAndNewRes {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<HotAndNewData> results;

  HotAndNewRes({
    this.page,
    this.results = const [],
  });

  factory HotAndNewRes.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewResFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewResToJson(this);
}

@JsonSerializable()
class HotAndNewData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

// in case of tv , use name instead of original_title
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  HotAndNewData({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory HotAndNewData.fromJson(Map<String, dynamic> json) {
    return _$HotAndNewDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotAndNewDataToJson(this);
}
