import 'package:equatable/equatable.dart';

class FollowingProduction with EquatableMixin {
  int? daysUntil;
  int? id;
  String? overview;
  String? posterUrl;
  String? releaseDate;
  String? title;
  String? type;

  FollowingProduction({
    this.daysUntil,
    this.id,
    this.overview,
    this.posterUrl,
    this.releaseDate,
    this.title,
    this.type,
  });

  @override
  List<Object?> get props =>
      [daysUntil, id, overview, posterUrl, releaseDate, title, type];

  FollowingProduction copyWith({
    int? daysUntil,
    int? id,
    String? overview,
    String? posterUrl,
    String? releaseDate,
    String? title,
    String? type,
  }) {
    return FollowingProduction(
      daysUntil: daysUntil ?? this.daysUntil,
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
      'id': id,
      'overview': overview,
      'poster_url': posterUrl,
      'release_date': releaseDate,
      'title': title,
      'type': type,
    };
  }

  factory FollowingProduction.fromJson(Map<String, dynamic> json) {
    return FollowingProduction(
      daysUntil: json['days_until'] as int?,
      id: json['id'] as int?,
      overview: json['overview'] as String?,
      posterUrl: json['poster_url'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );
  }
}
