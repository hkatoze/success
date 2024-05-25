import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/personalityTestResult.dart';
import 'package:success/models/qualifier.dart';
import 'package:success/models/user.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/fullPersonalityTest.dart';
import 'package:success/views/mainview.dart';

import 'package:success/views/resultScreen.dart';

class TemperamentTestView extends StatefulWidget {
  final User user;
  final List<Qualifier> qualifiers;
  final bool onQuizCompleted;
  final String isForceOrFaiblesse;
  const TemperamentTestView(
      {super.key,
      required this.qualifiers,
      required this.onQuizCompleted,
      required this.isForceOrFaiblesse,
      required this.user});

  @override
  State<TemperamentTestView> createState() => _TemperamentTestViewState();
}

class _TemperamentTestViewState extends State<TemperamentTestView> {
  double progressBar = 0;
  bool isFirstLaunch = true;
  bool isSelect = false;
  int _selectedOption = 0;
  int currentIndex = 0;
  int currentBatchIndex = 0;
  List<String> selectedTemperaments = [];
  User? newUser;
  @override
  void initState() {
    super.initState();
    setState(() {
      progressBar = widget.isForceOrFaiblesse == "FORCES" ? 2.5 : 50;
    });
    if (isFirstLaunch) {
      Future.delayed(700.milliseconds, () {
        lauchPopup();
      });
    }
    setState(() {
      isFirstLaunch = false;
    });
  }

  void lauchPopup() {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      btnOkColor: ktertiaryColor,
      btnOkText: "D'ACCORD",
      body: Center(
        child: SizedBox(
          height: 170,
          child: Column(
            children: [
              Text(
                "Découvrons ${widget.isForceOrFaiblesse == "FORCES" ? 'ensemble' : 'maintenant'} tes ${widget.isForceOrFaiblesse == "FORCES" ? 'forces' : 'faiblesses'}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: kprimaryColor, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Parmis les ${widget.isForceOrFaiblesse == "FORCES" ? 'forces' : 'faiblesses'} qui te seront proposées, tu choisiras celles qui te correspondent le mieux",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
      btnOkOnPress: () {
        setState(() {
          isFirstLaunch = false;
        });
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= widget.qualifiers.length) {
      String dominantTemperament =
          calculateDominantTemperament(selectedTemperaments);
      if (widget.isForceOrFaiblesse == 'FORCES') {
        DatabaseManager.instance.updateUser(User(
          id: widget.user.id,
          bacYear: widget.user.bacYear,
          comeFromCountry: widget.user.comeFromCountry,
          comeFromTown: widget.user.comeFromTown,
          firstnameAndLastname: widget.user.firstnameAndLastname,
          gender: widget.user.gender,
          phone: widget.user.phone,
          typeOfBac: widget.user.typeOfBac,
          dominantForceTemperament: dominantTemperament,
          dominantWeaknessTemperament: widget.user.dominantWeaknessTemperament,
          temperament: widget.user.temperament,
          skills: widget.user.skills,
        ));
      }
      if (widget.isForceOrFaiblesse == 'FAIBLESSES') {
        DatabaseManager.instance.updateUser(User(
          id: widget.user.id,
          bacYear: widget.user.bacYear,
          comeFromCountry: widget.user.comeFromCountry,
          comeFromTown: widget.user.comeFromTown,
          firstnameAndLastname: widget.user.firstnameAndLastname,
          gender: widget.user.gender,
          phone: widget.user.phone,
          typeOfBac: widget.user.typeOfBac,
          dominantForceTemperament: widget.user.dominantForceTemperament,
          dominantWeaknessTemperament: dominantTemperament,
          temperament: widget.user.temperament,
          skills: widget.user.skills,
        ));
      }
      DatabaseManager.instance.getLoggedUser().then(
        (value) {
          setState(() {
            newUser = value;
          });
        },
      );
      return FullPersonalityTest(
        user: newUser == null ? widget.user : newUser!,
      );
    }

    List<Qualifier> currentBatch =
        getNextBatch(widget.qualifiers, currentIndex);

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
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRightJoined,
                            duration: const Duration(milliseconds: 500),
                            reverseDuration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                            childCurrent: TemperamentTestView(
                              qualifiers: widget.qualifiers,
                              onQuizCompleted: widget.onQuizCompleted,
                              isForceOrFaiblesse: widget.isForceOrFaiblesse,
                              user: newUser == null ? widget.user : newUser!,
                            ),
                            child: Mainview(
                              user: newUser == null ? widget.user : newUser!,
                            )));
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 5),
                        child: Column(children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              widget.isForceOrFaiblesse,
                              style: const TextStyle(
                                  color: kprimaryColor, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                            "Quel qualificatif te décrit le mieux ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, color: kquaternaryColor),
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
            SizedBox(
              height: kHeight(context) * 0.5,
              child: ListView.builder(
                itemCount: currentBatch.length,
                itemBuilder: (context, index) {
                  return Bounce(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                    width: 3,
                                    color: currentBatch[index].id ==
                                            _selectedOption
                                        ? kquaternaryColor
                                        : ksecondaryColor)),
                            child: Center(
                                child: RadioListTile(
                              activeColor: kquinquinaryColor,
                              title: Text(
                                currentBatch[index].label,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              value: currentBatch[index].id,
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  isSelect = true;
                                  _selectedOption = value!;
                                  currentBatchIndex = index;
                                });
                              },
                            )),
                          ))
                      .animate()
                      .fade(duration: 1500.milliseconds, curve: Curves.ease);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: DefaultBtn(
                  width: double.infinity,
                  titleColor:
                      isSelect ? Colors.white : Colors.grey.withOpacity(0.3),
                  lighting: isSelect,
                  event: () {
                    setState(() {
                      selectedTemperaments
                          .add(currentBatch[currentBatchIndex].temperament);
                      isSelect = false;
                      progressBar = progressBar + 2.5;
                      currentIndex += 4;
                    });

                    if (progressBar == 30) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.info,
                        btnOkText: "D'ACCORD",
                        btnOkColor: ktertiaryColor,
                        body: Center(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "N'hésite pas à consulter un proche ou un ami si tu ne sais pas ce qui te décrit le mieux.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        btnOkOnPress: () {},
                      ).show();
                    }

                    if (progressBar == 55) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.info,
                        btnOkText: "C'EST COMPRIS",
                        btnOkColor: ktertiaryColor,
                        body: Center(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "Si tu ne sais pas ce qui te décrit le mieux, pense à ce qui aurait été ta reponse quand tu étais petit.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        btnOkOnPress: () {},
                      ).show();
                    }

                    if (progressBar == 80) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.info,
                        btnOkColor: ktertiaryColor,
                        btnOkText: "J'AI COMPRIS",
                        body: Center(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text(
                            "N'oublie pas que tu dois être sincère dans tes choix pour ne pas fausser le résultat.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )),
                        btnOkOnPress: () {},
                      ).show();
                    }
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

  @override
  void dispose() {
    super.dispose();
  }
}
