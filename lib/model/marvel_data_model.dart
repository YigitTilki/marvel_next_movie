import 'package:equatable/equatable.dart';
import 'package:marvel_next_movie/model/following_production.dart';

class MarvelData extends Equatable {
  final int? daysUntil;
  final FollowingProduction? followingProduction;
  final int? id;
  final String? overview;
  final String? posterUrl;
  final String? releaseDate;
  final String? title;
  final String? type;

  const MarvelData({
    this.daysUntil,
    this.followingProduction,
    this.id,
    this.overview,
    this.posterUrl,
    this.releaseDate,
    this.title,
    this.type,
  });

  @override
  List<Object?> get props => [
        daysUntil,
        followingProduction,
        id,
        overview,
        posterUrl,
        releaseDate,
        title,
        type
      ];

  MarvelData copyWith({
    int? daysUntil,
    FollowingProduction? followingProduction,
    int? id,
    String? overview,
    String? posterUrl,
    String? releaseDate,
    String? title,
    String? type,
  }) {
    return MarvelData(
      daysUntil: daysUntil ?? this.daysUntil,
      followingProduction: followingProduction ?? this.followingProduction,
      id: id ?? this.id,
      overview: overview ?? this.overview,
      posterUrl: posterUrl ?? this.posterUrl,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'days_until': daysUntil,
      'following_production': followingProduction,
      'id': id,
      'overview': overview,
      'poster_url': posterUrl,
      'release_date': releaseDate,
      'title': title,
      'type': type,
    };
  }

  factory MarvelData.fromJson(Map<String, dynamic> json) {
    return MarvelData(
      daysUntil: json['days_until'] as int?,
      followingProduction: json['following_production'] == null
          ? null
          : FollowingProduction.fromJson(
              json['following_production'] as Map<String, dynamic>),
      id: json['id'] as int?,
      overview: json['overview'] as String?,
      posterUrl: json['poster_url'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );
  }

// Add a factory method to handle the case when JSON data is a List
  factory MarvelData.fromListJson(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      // Assuming the first element in the list contains the necessary data
      return MarvelData.fromJson(jsonList[0]);
    } else {
      throw Exception('Invalid data format for List');
    }
  }
}
