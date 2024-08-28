import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';

import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/fullPersonalityTest.dart';


class StartSkillsTestView extends StatefulWidget {
  const StartSkillsTestView({super.key, required this.user});
  final User user;

  @override
  State<StartSkillsTestView> createState() => _StartSkillsTestViewState();
}

class _StartSkillsTestViewState extends State<StartSkillsTestView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: kHeight(context) * 0.03,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              const Expanded(
                  child: Text(
                "Test de compétences",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ))
            ],
          ),
          SizedBox(
            height: kHeight(context) * 0.02,
          ),
          Container(
            alignment: Alignment.center,
            height: kHeight(context) * 0.07,
            child: Image.asset(
              "assets/skills.png",
            ),
          ),
          SizedBox(
            height: kHeight(context) * 0.1,
          ),
          Center(
              child: SizedBox(
                  height: kHeight(context) * 0.57,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: kHeight(context) * 0.02,
                          left: kWidth(context) * 0.15,
                          right: kWidth(context) * 0.2,
                          child: AnimatedContainer(
                            duration: 1000.milliseconds,
                            curve: Curves.ease,
                            child: Center(
                              child: Lottie.asset(
                                  'assets/lotties/mascotte.json',
                                  height: kHeight(context) * 0.27),
                            ),
                          )),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: ChatBubble(
                            backGroundColor: const Color(0xFFE8E8EE),
                            clipper: ChatBubbleClipper3(
                                type: BubbleType.receiverBubble),
                            child: SizedBox(
                              width: 150.0,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 66, 65, 65),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 17,
                                  fontFamily: 'DINNextRoundedLTProMedium',
                                ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                        "Une suite d'adjectifs qualificatifs te seront proposer afin que tu choisisses lesquels te décrive.Si tu es perdu n'hésite pas  à te faire aider par un de tes proches qui te connais le mieux",
                                        speed: 20.milliseconds),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ))),
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
                        duration: const Duration(milliseconds: 500),
                        reverseDuration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                        childCurrent: StartSkillsTestView(
                          user: widget.user,
                        ),
                        child: FullPersonalityTest(
                          user: widget.user,
                          isUpdate: false,
                        )));
              },
              titleSize: 16,
              title: "COMMENCER",
              bgColor: ktertiaryColor),
          SizedBox(
            height: kHeight(context) * 0.01,
          )
        ],
      ),
    ));
  }
}
