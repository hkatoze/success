import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/filiere.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final String title;
  final Filiere filiere;

  const VideoPlayerScreen({
    super.key,
    required this.videoId,
    required this.title,
    required this.filiere,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            widget.title,
            style: const TextStyle(
                overflow: TextOverflow.clip,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 10,
          width: 100,
          color: widget.filiere.departement == "ST"
              ? ktertiaryColor.withOpacity(0.3)
              : ksecondaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
          child: Text(
            widget.filiere.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
