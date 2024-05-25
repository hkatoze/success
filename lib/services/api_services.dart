import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:success/models/youtubeVideo.dart';

const apiKey = "AIzaSyBkrA3Tkjasc9fxr5imzmtq5f62DQLT0Uc";
const channelId = "UCpJQwwIKI6_W6K6CVGDQQlA";
Future<List<YoutubeVideo>> fetchVideos() async {
  List<YoutubeVideo> allVideos = [];
  String? nextPageToken;

  do {
    final searchUrl = 'https://www.googleapis.com/youtube/v3/search'
        '?key=$apiKey'
        '&channelId=$channelId'
        '&part=snippet'
        '&order=date'
        '&maxResults=50'
        '&pageToken=${nextPageToken ?? ''}';

    final searchResponse = await http.get(Uri.parse(searchUrl));

    if (searchResponse.statusCode == 200) {
      final searchData = json.decode(searchResponse.body);
      final List videosJson = searchData['items'];

      List<dynamic> videoIds = videosJson
          .where((video) => video['id']['kind'] == 'youtube#video')
          .map((video) => video['id']['videoId'])
          .toList();

      final List<YoutubeVideo> videos = await fetchVideoDetails(videoIds);
      allVideos.addAll(videos);

      nextPageToken = searchData['nextPageToken'];
    } else {
      throw Exception('Erreur de chargement des vidéos');
    }
  } while (nextPageToken != null);

  return allVideos;
}

Future<List<YoutubeVideo>> fetchVideoDetails(List<dynamic> videoIds) async {
  final detailsUrl = 'https://www.googleapis.com/youtube/v3/videos'
      '?key=$apiKey'
      '&id=${videoIds.join(',')}'
      '&part=snippet,contentDetails,statistics';

  final detailsResponse = await http.get(Uri.parse(detailsUrl));

  if (detailsResponse.statusCode == 200) {
    final detailsData = json.decode(detailsResponse.body);
    final List videoDetailsJson = detailsData['items'];

    return videoDetailsJson.map((json) => YoutubeVideo.fromMap(json)).toList();
  } else {
    throw Exception('Erreur de chargement des détails des vidéos');
  }
}
