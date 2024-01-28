import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvel_next_movie/constants/project_padding.dart';
import 'package:marvel_next_movie/constants/project_spacer.dart';
import 'package:marvel_next_movie/marvel_data_list.dart';
import 'package:marvel_next_movie/model/marvel_data_model.dart';
import 'package:marvel_next_movie/provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movieChangeNotifier = ref.read(movieChangeNotifierProvider.notifier);
    var marvelDataList = ref.read(movieChangeNotifierProvider).marvelDataList;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: FutureBuilder<MarvelData>(
        future: movieChangeNotifier.getDataAndUpdateList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            if (data.id == null) {
              return const MarvelDataList();
            }
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(
                          data.posterUrl.toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image_outlined);
                          },
                        ),
                        Padding(
                          padding: ProjectPadding.allLarge() +
                              ProjectPadding.topLarge(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Release Date: ${data.releaseDate}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              ProjectSpacer.vertical5(),
                              Text(
                                "Releases in ${data.daysUntil} days",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: ProjectPadding.symHNormal(),
                        child: Text(
                          data.title.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 300.w,
                        child: Padding(
                          padding: ProjectPadding.symHNormal(),
                          child: Text(
                            data.overview.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: ProjectPadding.symHMedium(),
                        child: FloatingActionButton(
                          onPressed: () async {
                            marvelDataList;
                            movieChangeNotifier.updateBaseUrl(data.releaseDate);
                            ref.watch(movieChangeNotifierProvider);
                            setState(() {});
                          },
                          backgroundColor: Colors.white10,
                          foregroundColor: Colors.white,
                          child: const Icon(
                            Icons.arrow_right,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
