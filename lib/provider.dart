import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_next_movie/model/marvel_data_model.dart';

final movieChangeNotifierProvider =
    StateNotifierProvider<MovieChangeNotifier, MovieChangeState>((ref) {
  return MovieChangeNotifier();
});

class MovieChangeNotifier extends StateNotifier<MovieChangeState> {
  MovieChangeNotifier() : super(const MovieChangeState());

  void updateBaseUrl(String? date) {
    state = state.copyWith(baseUrl: date);
  }

  Future<MarvelData> getDataAndUpdateList() async {
    String baseUrl =
        "https://dev.whenisthenextmcufilm.com/api?date=${state.baseUrl}";
    var url = Uri.parse(baseUrl);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      final MarvelData marvelData =
          MarvelData.fromJson(json.decode(response.body));
      if (marvelData.id != null &&
          state.marvelDataList.contains(marvelData) == false) {
        state = state
            .copyWith(marvelDataList: [...state.marvelDataList, marvelData]);
      }
      return marvelData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class MovieChangeState extends Equatable {
  final String? baseUrl;
  final List<MarvelData> marvelDataList;

  const MovieChangeState({this.baseUrl, this.marvelDataList = const []});

  @override
  List<Object?> get props => [
        baseUrl,
        marvelDataList,
      ];

  MovieChangeState copyWith({
    String? baseUrl,
    List<MarvelData>? marvelDataList,
  }) {
    return MovieChangeState(
      baseUrl: baseUrl ?? this.baseUrl,
      marvelDataList: marvelDataList ?? this.marvelDataList,
    );
  }
}
