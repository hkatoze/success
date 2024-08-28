class YoutubeVideo {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final int viewCount;
  final int likeCount;
  final int shareCount;

  YoutubeVideo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.viewCount,
    required this.likeCount,
    required this.shareCount,
  });

  factory YoutubeVideo.fromMap(Map<String, dynamic> map) {
    return YoutubeVideo(
      id: map['id'],
      title: map['snippet']['title'],
      thumbnailUrl: map['snippet']['thumbnails']['high']['url'],
      duration: formatDuration(map['contentDetails']['duration']),
      viewCount: map['statistics']['viewCount'] != null
          ? int.parse(map['statistics']['viewCount'])
          : 0,
      likeCount: map['statistics']['likeCount'] != null
          ? int.parse(map['statistics']['likeCount'])
          : 0,
      shareCount: map['statistics']['shareCount'] != null
          ? int.parse(map['statistics']['shareCount'])
          : 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'duration': duration,
      'viewCount': viewCount,
      'likeCount': likeCount,
      'shareCount': shareCount,
    };
  }
}

String formatDuration(String isoDuration) {
  final regex = RegExp(r'PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?');
  final match = regex.firstMatch(isoDuration);

  if (match != null) {
    final hours = int.tryParse(match.group(1) ?? '0') ?? 0;
    final minutes = int.tryParse(match.group(2) ?? '0') ?? 0;
    final seconds = int.tryParse(match.group(3) ?? '0') ?? 0;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}H${minutes.toString().padLeft(2, '0')}min';
    } else if (minutes > 0) {
      return '${minutes}min';
    } else {
      return '${seconds}s';
    }
  }

  return isoDuration; // Return original if parsing fails
}
