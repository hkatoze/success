import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/startTemperamentTestView.dart';

class MeetingView extends StatefulWidget {
  final User user;
  const MeetingView({super.key, required this.user});

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> call(String recipient) async {
    await FlutterPhoneDirectCaller.callNumber(recipient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Rencontre avec le Campus",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              SizedBox(
                height: kHeight(context) * 0.03,
              ),
              SizedBox(
                height: kHeight(context) * 0.8,
                child: widget.user.dominantForceTemperament == "" ||
                        widget.user.dominantWeaknessTemperament == ""
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
                                        color: Color.fromARGB(255, 66, 65, 65),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                        fontFamily: 'DINNextRoundedLTProMedium',
                                      ),
                                      child: AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                              "Vous devez d'abord terminer le test avant de prendre un rendez-vous avec le campus",
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
                                          childCurrent: MeetingView(
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
                    : SizedBox(
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
                                        color: Color.fromARGB(255, 66, 65, 65),
                                        fontWeight: FontWeight.w200,
                                        fontSize: 17,
                                        fontFamily: 'DINNextRoundedLTProMedium',
                                      ),
                                      child: AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                              "Cliquez sur le button ci-dessous afin de prendre attache avec le campus pour un entretien personnalisé",
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
                                event: () async {
                                  await call("+22651306464");
                                },
                                titleSize: 16,
                                title: "JOINDRE LE CAMPUS",
                                bgColor: ktertiaryColor),
                            SizedBox(
                              height: kHeight(context) * 0.02,
                            ),
                          ],
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}
