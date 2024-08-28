import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:success/models/apiResponseModel.dart';
import 'package:success/models/filiere.dart';
import 'package:success/models/personalityTestResult.dart';
import 'package:success/models/user.dart';
import 'package:success/models/youtubeVideo.dart';

const apiKey = "AIzaSyBkrA3Tkjasc9fxr5imzmtq5f62DQLT0Uc";
const channelId = "UCpJQwwIKI6_W6K6CVGDQQlA";
const playlistId = "PLl2TDLqV-fdY4Is92ib5aF2Hz29Oev0RQ";
const endpoint = "https://successapi.onrender.com";
const token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcyMDUyNTIwMCwiZXhwIjoxNzUyMDYxMjAwfQ.dVOxycFVkwKu8wHfnGRyR1WOgGkizLGtkQ73UoGW1_4";
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

Future<dynamic> axios(String url, bool withoutHeader,
    {String methode = 'GET', Map<String, dynamic>? donnees}) async {
  final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer $token',
  };

  http.Response response;

  try {
    switch (methode) {
      case 'GET':
        !withoutHeader
            ? response = await http.get(Uri.parse(url), headers: headers)
            : response = await http.get(Uri.parse(url));
        break;
      case 'POST':
        response = await http.post(Uri.parse(url),
            headers: headers, body: jsonEncode(donnees));
        break;
      case 'PUT':
        response = await http.put(Uri.parse(url),
            headers: headers, body: jsonEncode(donnees));
        break;
      case 'DELETE':
        response = await http.delete(Uri.parse(url), headers: headers);
        break;
      default:
        throw Exception("Méthode HTTP non supportée");
    }

    return json.decode(response.body);
  } catch (e) {
    debugPrint('$e');
    return {"message": "$e"};
  }
}

Future<ApiResponseModel> register(
  String nomEtPrenom,
  String genre,
  String phone,
  String typeBac,
  String anneeBac,
  String paysOrigine,
  String villeOrigine,
) async {
  final response =
      await axios('$endpoint/api/signup', false, methode: 'POST', donnees: {
    'nom_et_prenom': nomEtPrenom,
    'genre': genre,
    'phone': phone,
    'type_bac': typeBac,
    'annee_bac': anneeBac,
    'pays_origine': paysOrigine,
    'ville_origine': villeOrigine,
    'dominantForceTemperament': "",
    'dominantWeaknessTemperament': "",
    'temperament': "",
    'skills': "",
  });
  try {
    debugPrint(response["message"]);
    return ApiResponseModel(
        message: response["message"], data: response["data"]);
  } catch (e) {
    return ApiResponseModel(message: "$e");
  }
}

Future<ApiResponseModel> login(
  String phone,
) async {
  final response =
      await axios('$endpoint/api/login', false, methode: 'POST', donnees: {
    'phone': phone,
  });
  try {
    debugPrint(response["message"]);
    return ApiResponseModel(
        message: response["message"],
        data: {'verificationCode': response['verificationCode']});
  } catch (e) {
    debugPrint('$e');
    return ApiResponseModel(message: "$e");
  }
}

Future<ApiResponseModel> checkCodeForLogin(
    String phone, String verificationCode) async {
  final response =
      await axios('$endpoint/api/check-code', false, methode: 'POST', donnees: {
    'phone': phone,
    'verificationCode': verificationCode,
  });
  try {
    debugPrint(response["message"]);
    return ApiResponseModel(
        message: response["message"], data: response['data']);
  } catch (e) {
    debugPrint('$e');
    return ApiResponseModel(message: "$e");
  }
}

Future<ApiResponseModel> addTestResult(
  int userId,
  int testId,
  String testResult,
) async {
  final response = await axios('$endpoint/api/testResultats', false,
      methode: 'POST',
      donnees: {
        'userId': userId,
        'testId': testId,
        'testResult': testResult,
      });
  try {
    debugPrint(response["data"]);
    return ApiResponseModel(
        message: response["message"], data: response["data"]);
  } catch (e) {
    return ApiResponseModel(message: "$e");
  }
}

Future<List<Filiere>> getAllSectors() async {
  final response = await axios('$endpoint/api/filieres', false, methode: 'GET');

  try {
    if (response["message"] ==
        "La liste complète des filieres a bien été reccupérée.") {
      List<dynamic> filiereData = response["data"];
      return filiereData.map((item) => Filiere.fromMap(item)).toList();
    } else {
      return [];
    }
  } catch (e) {
    debugPrint("=========ERROR: $e");
    return [];
  }
}

Future<List<Temperament>> getAllTemperaments() async {
  final response =
      await axios('$endpoint/api/temperaments', false, methode: 'GET');

  try {
    if (response["message"] ==
        "La liste complète des temperaments a bien été reccupérée.") {
      List<dynamic> temperamentData = response["data"];
      return temperamentData.map((item) => Temperament.fromMap(item)).toList();
    } else {
      return [];
    }
  } catch (e) {
    debugPrint("=========ERROR TEMPERAMENT FETCH: $e");
    return [];
  }
}

Future<ApiResponseModel> updateUserOfDatabase(User user) async {
  try {
    final response = await axios('$endpoint/api/users/${user.id}', false,
        methode: 'PUT',
        donnees: {
          'nom_et_prenom': user.firstnameAndLastname,
          'genre': user.gender,
          'phone': user.phone,
          'type_bac': user.typeOfBac,
          'annee_bac': user.bacYear,
          'pays_origine': user.comeFromCountry,
          'ville_origine': user.comeFromTown,
          'dominantForceTemperament': user.dominantForceTemperament,
          'dominantWeaknessTemperament': user.dominantWeaknessTemperament,
          'temperament':
              "${user.dominantForceTemperament} ${user.dominantWeaknessTemperament}",
          'skills': "",
        });

    return ApiResponseModel(
        message: response["message"], data: response["data"]);
  } catch (e) {
    return ApiResponseModel(message: "$e");
  }
}
