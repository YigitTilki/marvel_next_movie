import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_next_movie/model/marvel_data_model.dart';
import 'package:marvel_next_movie/provider.dart';

class MarvelDataList extends ConsumerWidget {
  const MarvelDataList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var marvelDataList = ref.read(movieChangeNotifierProvider).marvelDataList;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: 550.h,
          ),
          child: ListView.builder(
            itemCount: marvelDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ListTile(
                  onTap: () {
                    marvelOverviewPopUp(context, marvelDataList, index);
                  },
                  leading:
                      Image.network(marvelDataList[index].posterUrl.toString()),
                  title: Text(
                    marvelDataList[index].title.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    marvelDataList[index].releaseDate.toString(),
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  trailing: Text(
                    "${marvelDataList[index].daysUntil.toString()}d",
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            closeApp();
          },
          icon: const Icon(Icons.exit_to_app),
          label: const Text("Exit"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        ),
      ],
    );
  }

  Future<dynamic> marvelOverviewPopUp(
      BuildContext context, List<MarvelData> marvelDataList, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              marvelDataList[index].title.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            icon: Image.network(marvelDataList[index].posterUrl.toString()),
            content: Text(
              marvelDataList[index].overview.toString(),
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
            actions: [
              Text(
                marvelDataList[index].releaseDate.toString(),
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
              Text(
                "${marvelDataList[index].daysUntil.toString()}day",
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          );
        });
  }

  void closeApp() {
    Future.delayed(const Duration(milliseconds: 300), () {
      exit(0);
    });
  }
}
