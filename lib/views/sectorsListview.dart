import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/models/youtubeVideo.dart';
import 'package:success/services/api_services.dart';

import 'package:success/views/components/defaultBtn.dart';

import 'package:success/views/startTemperamentTestView.dart';
import 'package:success/views/videoPlayerScreen.dart';

class SectorsListview extends StatefulWidget {
  final User user;
  const SectorsListview({super.key, required this.user});

  @override
  State<SectorsListview> createState() => _SectorsListviewState();
}

class _SectorsListviewState extends State<SectorsListview> {
  double toolbarIndex = 1;
  late Future<List<YoutubeVideo>> _videos;

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchYoutubeVideos() async {
    _videos = fetchVideos();
  }

  void fetchInitVideos() async {
    if (widget.user.skills != "") {
      setState(() {
        _videos = fetchVideos();
      });
    } else {}
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
          title: const Text(
            "Vos filières",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: kHeight(context) * 0.03,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bounce(
                      onTap: () {
                        setState(() {
                          toolbarIndex = 1;
                        });
                        fetchYoutubeVideos();
                      },
                      child: ToolbarBtn(
                          isSelect: toolbarIndex == 1, title: "Recommandées"),
                    ),
                    Bounce(
                        onTap: () {
                          setState(() {
                            toolbarIndex = 2;
                          });
                          fetchYoutubeVideos();
                        },
                        child: ToolbarBtn(
                            isSelect: toolbarIndex == 2,
                            title: "Toutes les filières")),
                  ],
                ),
              ),
              SizedBox(
                height: kHeight(context) * 0.03,
              ),
              SizedBox(
                height: kHeight(context) * 0.7,
                child: RefreshIndicator(
                  onRefresh: fetchYoutubeVideos,
                  color: kquinquinaryColor,
                  child: toolbarIndex == 1 &&
                          (widget.user.temperament == null ||
                              widget.user.temperament == "" ||
                              widget.user.skills == null ||
                              widget.user.skills == "")
                      ? SizedBox(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: kWidth(context) * 0.35,
                                  ),
                                  ChatBubble(
                                    backGroundColor: const Color(0xFFE8E8EE),
                                    clipper: ChatBubbleClipper3(
                                        type: BubbleType.receiverBubble),
                                    child: SizedBox(
                                      width: 150.0,
                                      child: DefaultTextStyle(
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 66, 65, 65),
                                          fontWeight: FontWeight.w200,
                                          fontSize: 17,
                                          fontFamily:
                                              'DINNextRoundedLTProMedium',
                                        ),
                                        child: AnimatedTextKit(
                                          isRepeatingAnimation: false,
                                          animatedTexts: [
                                            TyperAnimatedText(
                                                "Désolé, je ne connais pas ta personnalité pour le moment alors je ne peux te recommander des filières",
                                                speed: 40.milliseconds),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).animate().scale(curve: Curves.bounceInOut)
                                ],
                              ),
                              Center(
                                  child: Lottie.asset(
                                'assets/lotties/mascotte.json',
                                height: kHeight(context) * 0.3,
                              )),
                              const Expanded(child: SizedBox()),
                              DefaultBtn(
                                  width: kWidth(context) * 0.9,
                                  titleColor: Colors.white,
                                  event: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.scale,
                                            alignment: Alignment.center,
                                            duration: 1000.milliseconds,
                                            curve: Curves.ease,
                                            reverseDuration: 1000.milliseconds,
                                            childCurrent: SectorsListview(
                                              user: widget.user,
                                            ),
                                            child: StartTemperamentTestView(
                                              user: widget.user,
                                            )));
                                  },
                                  titleSize: 16,
                                  title: "DECOUVRIR MA PERSONNALITE",
                                  bgColor: ktertiaryColor),
                              SizedBox(
                                height: kHeight(context) * 0.02,
                              ),
                            ],
                          ),
                        )
                      : FutureBuilder<List<YoutubeVideo>>(
                          future: _videos,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text('No videos found'));
                            } else {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  YoutubeVideo video = snapshot.data![index];
                                  return VideoItem(
                                    id: video.id,
                                    title: video.title,
                                    thumbnailUrl: video.thumbnailUrl,
                                    duration: video.duration,
                                    viewCount: video.viewCount,
                                    likeCount: video.likeCount,
                                    shareCount: video.shareCount,
                                    user: widget.user,
                                  );
                                },
                              );
                            }
                          },
                        ),
                ),
              )
            ],
          ),
        ));
  }
}

class VideoDataInfos extends StatelessWidget {
  final IconData icon;
  final String infos;
  const VideoDataInfos({super.key, required this.infos, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: 90,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            infos,
            style: const TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}

class ToolbarBtn extends StatefulWidget {
  final String title;
  final bool isSelect;
  const ToolbarBtn({super.key, required this.isSelect, required this.title});

  @override
  State<ToolbarBtn> createState() => _ToolbarBtnState();
}

class _ToolbarBtnState extends State<ToolbarBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: widget.isSelect ? Colors.white : kprimaryColor,
          border: Border.all(
              color: widget.isSelect ? kquaternaryColor : kprimaryColor),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        widget.title,
        style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: widget.isSelect ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class VideoItem extends StatelessWidget {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final int viewCount;
  final int likeCount;
  final int shareCount;
  final User user;
  const VideoItem(
      {super.key,
      required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.duration,
      required this.viewCount,
      required this.likeCount,
      required this.shareCount,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: kprimaryColor, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: kprimaryColor,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(thumbnailUrl)),
                borderRadius: BorderRadius.circular(25)),
            child: Column(children: [
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VideoDataInfos(
                      infos: '$viewCount views', icon: Icons.visibility),
                  VideoDataInfos(
                      infos: '$likeCount likes', icon: Icons.thumb_up),
                  VideoDataInfos(infos: '$shareCount shares', icon: Icons.share)
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 110,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: kWidth(context) * 0.61,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 50,
                      decoration: BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                Bounce(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              childCurrent: SectorsListview(user: user),
                              child: VideoPlayerScreen(
                                videoId: id,
                                title: title,
                              )));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 30,
                              height: 30,
                            ),
                            const Text(
                              "Lire",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Icon(Icons.play_arrow),
                            )
                          ],
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
