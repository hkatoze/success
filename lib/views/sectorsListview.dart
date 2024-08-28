import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/filiere.dart';
import 'package:success/models/personalityTestResult.dart';
import 'package:success/models/user.dart';
import 'package:success/models/youtubeVideo.dart';
import 'package:success/services/api_services.dart';

import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/sectorView.dart';

import 'package:success/views/startTemperamentTestView.dart';

class SectorsListview extends StatefulWidget {
  final User user;
  const SectorsListview({super.key, required this.user});

  @override
  State<SectorsListview> createState() => _SectorsListviewState();
}

class _SectorsListviewState extends State<SectorsListview> {
  double toolbarIndex = 1;
  late Future<List<YoutubeVideo>> videos;
  List<Filiere> recommandedFilieres = [];
  List<Filiere> stFilieres = [];
  List<Filiere> sgFilieres = [];
  List<Temperament> allTemperaments = [];
  List<Filiere> allFilieres = [];

  @override
  void initState() {
    super.initState();
    fetchInitVideos();
    recommandationFunctions();
  }

  void recommandationFunctions() async {
    await fetchAllTemperaments();
    await fetchAllFilieres();
    setState(() {
      recommandedFilieres = recommanderFilieres(allFilieres, allTemperaments,
          '${widget.user.dominantForceTemperament} ${widget.user.dominantWeaknessTemperament}');
    });
  }

  Future<void> fetchAllTemperaments() async {
    final response = await getAllTemperaments();
    setState(() {
      allTemperaments = response;
    });
  }

  Future<void> fetchAllFilieres() async {
    final response = await getAllSectors();
    setState(() {
      allFilieres = response;
    });
  }

  Future<void> fetchYoutubeVideos() async {
    videos = fetchVideos();
  }

  void fetchInitVideos() async {
    if (widget.user.dominantForceTemperament != "") {
      setState(() {
        videos = fetchVideos();
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          color: Colors.white,
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
                child: FutureBuilder<List<Filiere>>(
                  future: getAllSectors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erreur: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text('Aucune filière trouvée'));
                    }

                    List<Filiere> allFilieres = snapshot.data!;
                    List<Filiere> stFilieres = allFilieres
                        .where((filiere) => filiere.departement == 'ST')
                        .toList();
                    List<Filiere> sgFilieres = allFilieres
                        .where((filiere) => filiere.departement == 'SG')
                        .toList();

                    return toolbarIndex == 1 &&
                            (widget.user.dominantForceTemperament == "" ||
                                widget.user.dominantWeaknessTemperament == "")
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
                                              reverseDuration:
                                                  1000.milliseconds,
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
                        : toolbarIndex == 1 &&
                                (widget.user.dominantForceTemperament != "" &&
                                    widget.user.dominantWeaknessTemperament !=
                                        "")
                            ? SizedBox(
                                height: kHeight(context) * 0.85,
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 435,
                                      child: ListView.builder(
                                          itemCount: recommandedFilieres.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              FiliereItem(
                                                  user: widget.user,
                                                  filiere: recommandedFilieres[
                                                      index])),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(
                                height: kHeight(context) * 0.85,
                                child: ListView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                          color:
                                              ktertiaryColor.withOpacity(0.3)),
                                      child: const Row(
                                        children: [
                                          Text(
                                            "SCIENCES DE TECHNOLOGIE",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 435,
                                      child: ListView.builder(
                                          itemCount: stFilieres.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              FiliereItem(
                                                  user: widget.user,
                                                  filiere: stFilieres[index])),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      decoration: const BoxDecoration(
                                          color: ksecondaryColor),
                                      child: const Row(
                                        children: [
                                          Text(
                                            "SCIENCES DE GESTION",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 465,
                                      child: ListView.builder(
                                          itemCount: sgFilieres.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              FiliereItem(
                                                  user: widget.user,
                                                  filiere: sgFilieres[index])),
                                    ),
                                  ],
                                ),
                              );
                  },
                ),
              ),
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

class FiliereItem extends StatelessWidget {
  final Filiere filiere;
  final User user;
  const FiliereItem({super.key, required this.filiere, required this.user});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.center,
                duration: 1000.milliseconds,
                curve: Curves.ease,
                reverseDuration: 1000.milliseconds,
                childCurrent: SectorsListview(
                  user: user,
                ),
                child: SectorView(
                  filiere: filiere,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: filiere.departement == "ST"
                        ? ktertiaryColor.withOpacity(0.3)
                        : ksecondaryColor,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    filiere.nom,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            const Row(
              children: [
                Text(
                  "Découvrir",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            )
          ],
        ),
      ),
    );
  }
}
