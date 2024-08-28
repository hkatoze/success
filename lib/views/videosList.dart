import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/filiere.dart';
import 'package:success/models/youtubeVideo.dart';
import 'package:success/services/api_services.dart';
import 'package:success/views/videoPlayerScreen.dart';

const List<String> stopWords = [
  'le',
  'la',
  'les',
  'un',
  'une',
  'des',
  'et',
  'ou',
  'mais',
  'donc',
  'or',
  'ni',
  'car',
  'à',
  'de',
  'du',
  'en'
];

class Videoslist extends StatefulWidget {
  final Filiere filiere;
  const Videoslist({super.key, required this.filiere});

  @override
  State<Videoslist> createState() => _VideoslistState();
}

class _VideoslistState extends State<Videoslist> {
  late Future<List<YoutubeVideo>> _videos;

  @override
  void initState() {
    super.initState();
    fetchInitVideos();
  }

  Future<List<YoutubeVideo>> fetchYoutubeVideos() async {
    List<YoutubeVideo> videos = await fetchVideos();
    String filiereName = widget.filiere.nom.toLowerCase();
    List<String> filiereWords = filiereName
        .split(' ')
        .where((word) => !stopWords.contains(word))
        .toList();

    return videos.where((video) {
      String title = video.title.toLowerCase();
      return filiereWords.any((word) => title.split(' ').contains(word));
    }).toList();
  }

  void fetchInitVideos() {
    setState(() {
      _videos = fetchYoutubeVideos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.filiere.nom,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
          height: kHeight(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kHeight(context) * 0.8,
                  child: FutureBuilder<List<YoutubeVideo>>(
                    future: _videos,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: const Text(
                            'Aucune immersion disponible pour le moment',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ));
                      } else {
                        return VideoPlayerScreen(
                          videoId: snapshot.data![0].id,
                          title: snapshot.data![0].title,
                          filiere: widget.filiere,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
