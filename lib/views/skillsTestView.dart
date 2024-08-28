import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:success/constants.dart';
import 'package:success/models/qualifier.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/components/option.dart';
import 'package:success/views/components/options.dart';

class SkillsTestView extends StatefulWidget {
  final List<Qualifier> qualifiers;
  final bool onQuizCompleted;
  const SkillsTestView(
      {super.key, required this.qualifiers, required this.onQuizCompleted});

  @override
  State<SkillsTestView> createState() => _SkillsTestViewState();
}

class _SkillsTestViewState extends State<SkillsTestView> {
  double progressBar = 6.6666666;
  bool isSelect = false;
  int questionIndex = 1;
  List<Qualifier> qualifiers = [];

  void nextQuestion(BuildContext context) {
    setState(() {
      isSelect = false;
      progressBar = progressBar + 6.6666666;
      questionIndex = questionIndex + 1;
    });
    if (questionIndex == 6 || questionIndex == 11) {
      qualifiers.shuffle();

      AwesomeDialog(
        context: context,
        animType: AnimType.scale,
        dialogType: DialogType.info,
        btnOkColor: ktertiaryColor,
        body: const Center(
          child: Text(
            "N'oublie pas que tu peux toujours demander à un de tes proche qui te connais le mieux si tu es perdu.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        btnOkOnPress: () {},
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      height: kHeight(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: FAProgressBar(
                    currentValue: progressBar,
                    animatedDuration: 1000.milliseconds,
                    size: 15,
                    backgroundColor: kprimaryColor,
                    progressColor: kquaternaryColor,
                    displayText: '',
                    displayTextStyle: const TextStyle(color: kquaternaryColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(alignment: Alignment.topCenter, children: [
                Container(
                  height: 190,
                  width: kWidth(context) * 0.95,
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    bottom: 0,
                    left: kWidth(context) * 0.05,
                    right: kWidth(context) * 0.05,
                    child: Container(
                      height: 170,
                      width: kWidth(context) * 0.90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: kprimaryColor.withOpacity(.4))
                          ]),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                        child: Column(children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "Question 3/10",
                              style: TextStyle(color: kprimaryColor),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Quel qualificatif te décrit le mieux ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: kquaternaryColor),
                          )
                        ]),
                      ),
                    )),
                Positioned(
                    bottom: 150,
                    left: kWidth(context) * 0.25,
                    right: kWidth(context) * 0.25,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Lottie.asset('assets/lotties/mascotte.json',
                            height: 90),
                      ),
                    ))
              ]),
            ),
            //question1-6-11
            if (questionIndex == 1 || questionIndex == 6 || questionIndex == 11)
              Options(
                      height: kHeight(context) * 0.5,
                      action: () {
                        setState(() {
                          isSelect = true;
                        });
                      },
                      options: <Option>[
                    Option(
                      option: qualifiers[0].label,
                      value: qualifiers[0].id,
                    ),
                    Option(
                      option: qualifiers[1].label,
                      value: qualifiers[1].id,
                    ),
                    Option(
                      option: qualifiers[2].label,
                      value: qualifiers[2].id,
                    ),
                    Option(
                      option: qualifiers[3].label,
                      value: qualifiers[3].id,
                    ),
                  ])
                  .animate()
                  .fade(duration: 1500.milliseconds, curve: Curves.ease),

            //question2-7-12
            if (questionIndex == 2 || questionIndex == 7 || questionIndex == 12)
              Options(
                      height: kHeight(context) * 0.5,
                      action: () {
                        setState(() {
                          isSelect = true;
                        });
                      },
                      options: <Option>[
                    Option(
                      option: qualifiers[4].label,
                      value: qualifiers[4].id,
                    ),
                    Option(
                      option: qualifiers[5].label,
                      value: qualifiers[5].id,
                    ),
                    Option(
                      option: qualifiers[6].label,
                      value: qualifiers[6].id,
                    ),
                    Option(
                      option: qualifiers[7].label,
                      value: qualifiers[7].id,
                    ),
                  ])
                  .animate()
                  .fade(duration: 1500.milliseconds, curve: Curves.ease),

            //question3-8-13
            if (questionIndex == 3 || questionIndex == 8 || questionIndex == 13)
              Options(
                      height: kHeight(context) * 0.5,
                      action: () {
                        setState(() {
                          isSelect = true;
                        });
                      },
                      options: <Option>[
                    Option(
                      option: qualifiers[8].label,
                      value: qualifiers[8].id,
                    ),
                    Option(
                      option: qualifiers[9].label,
                      value: qualifiers[9].id,
                    ),
                    Option(
                      option: qualifiers[10].label,
                      value: qualifiers[10].id,
                    ),
                    Option(
                      option: qualifiers[11].label,
                      value: qualifiers[11].id,
                    ),
                  ])
                  .animate()
                  .fade(duration: 1500.milliseconds, curve: Curves.ease),

            //question4-9-14
            if (questionIndex == 4 || questionIndex == 9 || questionIndex == 14)
              Options(
                      height: kHeight(context) * 0.5,
                      action: () {
                        setState(() {
                          isSelect = true;
                        });
                      },
                      options: <Option>[
                    Option(
                      option: qualifiers[12].label,
                      value: qualifiers[12].id,
                    ),
                    Option(
                      option: qualifiers[13].label,
                      value: qualifiers[13].id,
                    ),
                    Option(
                      option: qualifiers[14].label,
                      value: qualifiers[14].id,
                    ),
                    Option(
                      option: qualifiers[15].label,
                      value: qualifiers[15].id,
                    ),
                  ])
                  .animate()
                  .fade(duration: 1500.milliseconds, curve: Curves.ease),

            //question5-10-15
            if (questionIndex == 5 ||
                questionIndex == 10 ||
                questionIndex == 15)
              Options(
                      height: kHeight(context) * 0.5,
                      action: () {
                        setState(() {
                          isSelect = true;
                        });
                      },
                      options: <Option>[
                    Option(
                      option: qualifiers[16].label,
                      value: qualifiers[16].id,
                    ),
                    Option(
                      option: qualifiers[17].label,
                      value: qualifiers[17].id,
                    ),
                    Option(
                      option: qualifiers[18].label,
                      value: qualifiers[18].id,
                    ),
                    Option(
                      option: qualifiers[19].label,
                      value: qualifiers[19].id,
                    ),
                  ])
                  .animate()
                  .fade(duration: 1500.milliseconds, curve: Curves.ease),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: DefaultBtn(
                  width: double.infinity,
                  titleColor:
                      isSelect ? Colors.white : Colors.grey.withOpacity(0.3),
                  lighting: isSelect,
                  event: () {
                    nextQuestion(context);
                  },
                  titleSize: 16,
                  title: "SUIVANT",
                  borderColor:
                      isSelect ? ktertiaryColor : const Color(0xFFE8E8EE),
                  bgColor: isSelect ? ktertiaryColor : const Color(0xFFE8E8EE)),
            ),
          ],
        ),
      ),
    ));
  }
}
