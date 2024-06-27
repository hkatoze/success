import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:success/models/youtubeVideo.dart';

const apiKey = "AIzaSyBkrA3Tkjasc9fxr5imzmtq5f62DQLT0Uc";
const channelId = "UCpJQwwIKI6_W6K6CVGDQQlA";
const playlistId = "PLl2TDLqV-fdY4Is92ib5aF2Hz29Oev0RQ";

Future<List<YoutubeVideo>> fetchVideos() async {
  List<YoutubeVideo> allVideos = [];
  String? nextPageToken;

  do {
    final playlistItemsUrl =
        'https://www.googleapis.com/youtube/v3/playlistItems'
        '?key=$apiKey'
        '&playlistId=$playlistId'
        '&part=snippet'
        '&maxResults=50'
        '&pageToken=${nextPageToken ?? ''}';

    final playlistItemsResponse = await http.get(Uri.parse(playlistItemsUrl));

    if (playlistItemsResponse.statusCode == 200) {
      final playlistItemsData = json.decode(playlistItemsResponse.body);
      final List videosJson = playlistItemsData['items'];

      List<dynamic> videoIds = videosJson
          .map((video) => video['snippet']['resourceId']['videoId'])
          .toList();

      final List<YoutubeVideo> videos = await fetchVideoDetails(videoIds);
      allVideos.addAll(videos);

      nextPageToken = playlistItemsData['nextPageToken'];
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
