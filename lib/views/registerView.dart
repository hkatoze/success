import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_keyboard/custom_keyboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/apiResponseModel.dart';
import 'package:success/models/user.dart';
import 'package:success/services/api_services.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/components/defaultTextField.dart';
import 'package:success/views/components/infosItem.dart';

import 'package:success/views/components/option.dart';
import 'package:success/views/components/options.dart';

import 'package:success/views/introduceView.dart';
import 'package:success/views/loginview.dart';
import 'package:success/views/startTemperamentTestView.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    super.initState();
    logout();
  }

  void logout() async {
    await DatabaseManager.instance.clearDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: kHeight(context),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: kHeight(context) * 0.03,
          ),
          RichText(
              text: const TextSpan(
                  text: "Bienvenu sur ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: "SUCCESS",
                    style: TextStyle(
                        color: ktertiaryColor, fontStyle: FontStyle.italic))
              ])),
          SizedBox(
            height: kHeight(context) * 0.01,
          ),
          Text(
            "Votre outil d'orientation",
            style:
                TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.6)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.2))),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.school,
                        color: ktertiaryColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                          child: Text(
                        "Version nouveaux bacheliers",
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: ktertiaryColor, fontSize: 15),
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.money_off,
                        color: ktertiaryColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                          child: Text(
                        "Version gratuite",
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: ktertiaryColor, fontSize: 15),
                      )),
                    ],
                  )
                ]),
          ),
          SizedBox(
            height: kHeight(context) * 0.09,
          ),
          Row(
            children: [
              SizedBox(
                width: kWidth(context) * 0.35,
              ),
              ChatBubble(
                backGroundColor: const Color(0xFFE8E8EE),
                clipper: ChatBubbleClipper3(type: BubbleType.receiverBubble),
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
                            "Salut moi c'est SAKI ta coach d'orientation",
                            speed: 40.milliseconds),
                      ],
                    ),
                  ),
                ),
              )
                  .animate()
                  .scale(delay: 4500.milliseconds, curve: Curves.bounceInOut)
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
                        type: PageTransitionType.rightToLeftJoined,
                        duration: 1000.milliseconds,
                        curve: Curves.ease,
                        reverseDuration: 1000.milliseconds,
                        childCurrent: const IntroduceView(),
                        child: const AnswerToResponse()));
              },
              titleSize: 16,
              title: "COMMENCER",
              bgColor: ktertiaryColor),
          SizedBox(
            height: kHeight(context) * 0.02,
          ),
          DefaultBtn(
              width: kWidth(context) * 0.9,
              titleColor: ktertiaryColor,
              event: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftJoined,
                        duration: 1000.milliseconds,
                        curve: Curves.ease,
                        reverseDuration: 1000.milliseconds,
                        childCurrent: const IntroduceView(),
                        child: const Loginview()));
              },
              titleSize: 16,
              lighting: false,
              title: "J'AI DÉJÀ UN COMPTE",
              bgColor: Colors.white),
        ],
      ),
    );
  }
}

class AnswerToResponse extends StatefulWidget {
  const AnswerToResponse({super.key});

  @override
  State<AnswerToResponse> createState() => _AnswerToResponseState();
}

class _AnswerToResponseState extends State<AnswerToResponse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: kHeight(context) * 0.03,
              ),
              RichText(
                  text: const TextSpan(
                      text: "Bienvenu sur ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: "SUCCESS",
                        style: TextStyle(
                            color: ktertiaryColor, fontStyle: FontStyle.italic))
                  ])),
              SizedBox(
                height: kHeight(context) * 0.01,
              ),
              Text(
                "Votre outil d'orientation",
                style: TextStyle(
                    fontSize: 17, color: Colors.black.withOpacity(0.6)),
              ),
              SizedBox(
                height: kHeight(context) * 0.2,
              ),
              Center(
                  child: SizedBox(
                      height: kHeight(context) * 0.5,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: kHeight(context) * 0.01,
                              left: kWidth(context) * 0.15,
                              right: kWidth(context) * 0.2,
                              child: Center(
                                child: Lottie.asset(
                                    'assets/lotties/mascotte.json',
                                    height: kHeight(context) * 0.45),
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
                                            "Reponds à 7 petites questions avant de commencer ton processus d'orientation ",
                                            speed: 40.milliseconds),
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
                  event: () async {
                    await DatabaseManager.instance.addUser(User(
                        id: 1,
                        bacYear: "",
                        comeFromCountry: "",
                        comeFromTown: "",
                        firstnameAndLastname: "",
                        gender: "",
                        phone: "",
                        typeOfBac: "",
                        dominantForceTemperament: "",
                        dominantWeaknessTemperament: "",
                        temperament: "",
                        skills: ""));
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftJoined,
                            duration: const Duration(milliseconds: 500),
                            reverseDuration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                            childCurrent: const AnswerToResponse(),
                            child: const RegisterInformations()));
                  },
                  titleSize: 16,
                  title: "C'EST PARTI",
                  bgColor: ktertiaryColor),
              SizedBox(
                height: kHeight(context) * 0.01,
              )
            ],
          ),
        ));
  }
}

class RegisterInformations extends StatefulWidget {
  const RegisterInformations({super.key});

  @override
  State<RegisterInformations> createState() => _RegisterInformationsState();
}

class _RegisterInformationsState extends State<RegisterInformations> {
  final controller1 = PageController();
  final controller2 = PageController();
  final firstnameAndLastnameController = TextEditingController();
  final keyboardController = CKController();

  final phoneController = TextEditingController();

  bool isSelect = false;
  int questionIndex = 0;
  double progressBar = 12.5;
  User? user;
  @override
  void initState() {
    super.initState();

    firstnameAndLastnameController.addListener(() {
      if (firstnameAndLastnameController.text != "") {
        setState(() {
          isSelect = true;
        });
      }
      DatabaseManager.instance.updateUser(User(
        id: user!.id,
        bacYear: user!.bacYear,
        comeFromCountry: user!.comeFromCountry,
        comeFromTown: user!.comeFromTown,
        firstnameAndLastname: firstnameAndLastnameController.text,
        gender: user!.gender,
        phone: user!.phone,
        typeOfBac: user!.typeOfBac,
        dominantForceTemperament: "",
        dominantWeaknessTemperament: "",
        temperament: "",
        skills: "",
      ));
    });
    phoneController.addListener(() {
      if (phoneController.text != "") {
        setState(() {
          isSelect = true;
        });
      }
      DatabaseManager.instance.updateUser(User(
        id: user!.id,
        bacYear: user!.bacYear,
        comeFromCountry: user!.comeFromCountry,
        comeFromTown: user!.comeFromTown,
        firstnameAndLastname: user!.firstnameAndLastname,
        gender: user!.gender,
        phone: phoneController.text,
        typeOfBac: user!.typeOfBac,
        dominantForceTemperament: "",
        dominantWeaknessTemperament: "",
        temperament: "",
        skills: "",
      ));
    });
  }

  void fetchUserInfos() async {
    final User? loggedUser = await DatabaseManager.instance.getLoggedUser();

    setState(() {
      user = loggedUser;
    });
  }

  void next(int page) async {
    fetchUserInfos();
    controller1.animateToPage(page,
        duration: 900.milliseconds, curve: Curves.ease);
    controller2.animateToPage(page,
        duration: 900.milliseconds, curve: Curves.ease);
    setState(() {
      questionIndex = page;
      progressBar = progressBar + 11.111111111;
    });
    await Future.delayed(
      500.milliseconds,
    );
    if (questionIndex <= 6) {
      setState(() {
        isSelect = false;
      });

      if (questionIndex == 4) {
        setState(() {
          isSelect = true;
        });
      }
    }

    debugPrint(questionIndex.toString());
  }

  void back(int page) async {
    if (questionIndex == 0 || questionIndex == 8) {
      Navigator.pop(context);
    } else {
      controller1.animateToPage(page - 1,
          duration: 900.milliseconds, curve: Curves.ease);
      controller2.animateToPage(page - 1,
          duration: 900.milliseconds, curve: Curves.ease);
      setState(() {
        questionIndex = page - 1;
        progressBar = progressBar - 11.111111111;
        isSelect = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                      back(questionIndex);
                    },
                    child: const Icon(
                      Icons.arrow_back,
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
                      displayTextStyle:
                          const TextStyle(color: kquaternaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: kHeight(context) * 0.01,
              ),
              AnimatedContainer(
                duration: 900.milliseconds,
                curve: Curves.ease,
                //color: Colors.blue,
                width: double.infinity,
                height: questionIndex == 4
                    ? kHeight(context) * 0.174
                    : kHeight(context) * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: 1000.milliseconds,
                            curve: Curves.ease,
                            child: Center(
                                child: Lottie.asset(
                                    'assets/lotties/mascotte.json',
                                    height: questionIndex == 8
                                        ? kHeight(context) * 0.3
                                        : kHeight(context) * 0.1)),
                          )
                              .animate()
                              .slideX(
                                  end: questionIndex == 8 ? 0.2 : 0,
                                  duration: 1000.milliseconds,
                                  curve: Curves.ease)
                              .slideY(
                                  end: questionIndex == 8 ? 1.2 : 0,
                                  duration: 1000.milliseconds,
                                  curve: Curves.ease),
                          const SizedBox(
                            width: 20,
                          ),
                          if (questionIndex <= 7)
                            Expanded(
                              child: SizedBox(
                                height: kHeight(context) * 0.12,
                                child: PageView(
                                  controller: controller1,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    //Type de BAC
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'Quel est ton type de BAC ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animate().slideX(
                                        begin: 1,
                                        duration: 900.milliseconds,
                                        curve: Curves.ease),
                                    //Année de BAC
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'En quelle année as tu eu ton BAC ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //Genre
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'Quel est ton genre ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Pays
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'De quel pays viens tu ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Ville
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'De quelle ville viens tu ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Nom & Prénom
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'Quel est ton nom et prénom ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Téléphone
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'Sur quel numéro de téléphone peut-on te joindre ?',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Infos sur les interets
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                                  'Regarde tout ce que tu découvrira avec success !',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    //vide
                                    ChatBubble(
                                      backGroundColor: const Color(0xFFE8E8EE),
                                      clipper: ChatBubbleClipper3(
                                          type: BubbleType.receiverBubble),
                                      child: SizedBox(
                                        width: 250.0,
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
                                              TyperAnimatedText(' ',
                                                  speed: 60.milliseconds),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ]),
                    if (questionIndex == 4)
                      Container(
                        margin: EdgeInsets.only(top: kHeight(context) * 0.01),
                        child: const Text(
                          "Si tu n'es pas du Burkina Faso, tu peux continuer sans choisir.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kquaternaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ).animate().slideX(
                          begin: 1,
                          duration: 900.milliseconds,
                          curve: Curves.ease)
                  ],
                ),
              ),
              AnimatedContainer(
                duration: 1000.milliseconds,
                curve: Curves.ease,
                height: kHeight(context) * 0.63,
                child: PageView(
                  controller: controller2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    //Type de BAC
                    Options(
                        height: kHeight(context) * 0.65,
                        action: () {
                          setState(() {
                            isSelect = true;
                          });
                        },
                        options: const <Option>[
                          Option(
                            option: "BAC A",
                            value: 1,
                          ),
                          Option(
                            option: "BAC B",
                            value: 2,
                          ),
                          Option(
                            option: "BAC C",
                            value: 3,
                          ),
                          Option(
                            option: "BAC D",
                            value: 4,
                          ),
                          Option(
                            option: "BAC E",
                            value: 5,
                          ),
                          Option(
                            option: "BAC F",
                            value: 6,
                          ),
                          Option(
                            option: "BAC G",
                            value: 7,
                          ),
                          Option(
                            option: "BAC H",
                            value: 8,
                          ),
                        ]).animate().slideX(
                        begin: 1,
                        duration: 900.milliseconds,
                        curve: Curves.ease),

                    //ANNEE DU BAC
                    Options(
                        height: kHeight(context) * 0.65,
                        action: () {
                          setState(() {
                            isSelect = true;
                          });
                        },
                        options: const <Option>[
                          Option(
                            option: "2024",
                            value: 1,
                          ),
                          Option(
                            option: "2023",
                            value: 2,
                          ),
                          Option(
                            option: "2022",
                            value: 3,
                          ),
                          Option(
                            option: "2021",
                            value: 4,
                          ),
                          Option(
                            option: "2020",
                            value: 5,
                          ),
                          Option(
                            option: "2019",
                            value: 6,
                          ),
                          Option(
                            option: "2018",
                            value: 7,
                          ),
                          Option(
                            option: "2017",
                            value: 8,
                          ),
                          Option(
                            option: "2016",
                            value: 9,
                          ),
                          Option(
                            option: "2015",
                            value: 10,
                          ),
                          Option(
                            option: "2014",
                            value: 11,
                          ),
                          Option(
                            option: "2013",
                            value: 12,
                          ),
                          Option(
                            option: "2012",
                            value: 13,
                          ),
                          Option(
                            option: "2011",
                            value: 14,
                          ),
                          Option(
                            option: "2010",
                            value: 15,
                          ),
                          Option(
                            option: "2009",
                            value: 16,
                          ),
                          Option(
                            option: "2008",
                            value: 17,
                          ),
                          Option(
                            option: "2007",
                            value: 18,
                          ),
                          Option(
                            option: "2006",
                            value: 19,
                          ),
                          Option(
                            option: "2005",
                            value: 20,
                          ),
                          Option(
                            option: "2004",
                            value: 21,
                          ),
                          Option(
                            option: "2003",
                            value: 22,
                          ),
                          Option(
                            option: "2002",
                            value: 23,
                          ),
                          Option(
                            option: "2001",
                            value: 24,
                          ),
                          Option(
                            option: "2000",
                            value: 25,
                          ),
                          Option(
                            option: "1999",
                            value: 26,
                          ),
                          Option(
                            option: "1998",
                            value: 27,
                          ),
                          Option(
                            option: "1997",
                            value: 28,
                          ),
                          Option(
                            option: "1996",
                            value: 29,
                          ),
                          Option(
                            option: "1995",
                            value: 30,
                          ),
                          Option(
                            option: "1994",
                            value: 31,
                          ),
                          Option(
                            option: "Autre",
                            value: 32,
                          ),
                        ]),
                    //Genre
                    Options(
                        height: kHeight(context) * 0.65,
                        action: () {
                          setState(() {
                            isSelect = true;
                          });
                        },
                        options: const <Option>[
                          Option(
                            option: "HOMME",
                            value: 1,
                          ),
                          Option(
                            option: "FEMME",
                            value: 2,
                          ),
                        ]),

                    //PAYS
                    Options(
                        height: kHeight(context) * 0.65,
                        action: () {
                          setState(() {
                            isSelect = true;
                          });
                        },
                        options: const <Option>[
                          Option(
                            option: "Bénin",
                            value: 1,
                          ),
                          Option(
                            option: "Burkina Faso",
                            value: 2,
                          ),
                          Option(
                            option: "Caméroun",
                            value: 3,
                          ),
                          Option(
                            option: "République du Congo",
                            value: 4,
                          ),
                          Option(
                            option: "Rép Démo du Congo",
                            value: 5,
                          ),
                          Option(
                            option: "Côte d'Ivoire",
                            value: 6,
                          ),
                          Option(
                            option: "Ghana",
                            value: 7,
                          ),
                          Option(
                            option: "Mali",
                            value: 8,
                          ),
                          Option(
                            option: "Niger",
                            value: 9,
                          ),
                          Option(
                            option: "Nigéria",
                            value: 10,
                          ),
                          Option(
                            option: "Sénégal",
                            value: 11,
                          ),
                          Option(
                            option: "Tchad",
                            value: 12,
                          ),
                          Option(
                            option: "Togo",
                            value: 13,
                          ),
                          Option(
                            option: "Hors d'Afrique",
                            value: 14,
                          ),
                          Option(
                            option: "--Autre--",
                            value: 15,
                          ),
                        ]),

                    //VILLE D'Origine
                    Options(
                        height: kHeight(context) * 0.65,
                        action: () {
                          setState(() {
                            isSelect = true;
                          });
                        },
                        options: const <Option>[
                          Option(
                            option: "Dédougou",
                            value: 1,
                          ),
                          Option(
                            option: "Banfora",
                            value: 2,
                          ),
                          Option(
                            option: "Ouagadougou",
                            value: 3,
                          ),
                          Option(
                            option: "Koudougou",
                            value: 4,
                          ),
                          Option(
                            option: "Manga",
                            value: 5,
                          ),
                          Option(
                            option: "Tenkodogo",
                            value: 6,
                          ),
                          Option(
                            option: "Fadam N Gourma",
                            value: 7,
                          ),
                          Option(
                            option: "Gaoua",
                            value: 8,
                          ),
                          Option(
                            option: "Bobo Dioulasso",
                            value: 9,
                          ),
                          Option(
                            option: "Dori",
                            value: 10,
                          ),
                          Option(
                            option: "Ziniaré",
                            value: 11,
                          ),
                          Option(
                            option: "Ouahigouya",
                            value: 12,
                          ),
                          Option(
                            option: "Kaya",
                            value: 13,
                          ),
                        ]),

                    //Nom & Prénom
                    SizedBox(
                      height: kHeight(context) * 0.65,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: kHeight(context) * 0.1,
                            ),
                            DefaultTextField(
                                controller: firstnameAndLastnameController,
                                action: TextInputAction.done,
                                hintText: "Nom et Prénom",
                                keyboardType: TextInputType.text,
                                width: kWidth(context)),
                          ],
                        ),
                      ),
                    ),

                    //Téléphone
                    SizedBox(
                      height: kHeight(context) * 0.65,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: kHeight(context) * 0.1,
                            ),
                            DefaultTextField(
                                controller: phoneController,
                                action: TextInputAction.done,
                                hintText: "Téléphone (sans indicatif)",
                                keyboardType: TextInputType.phone,
                                width: kWidth(context)),
                          ],
                        ),
                      ),
                    ),

                    //Infos
                    SizedBox(
                      height: kHeight(context) * 0.66,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: kHeight(context) * 0.02,
                            ),
                            const InfosItem(
                                    icon: "assets/personnality.png",
                                    subTitle:
                                        "Découvre qui tu es réellement, ton caractère , ta vraie personnalité",
                                    title: "Ton tempérament")
                                .animate()
                                .scale(curve: Curves.ease),
                            const InfosItem(
                                    icon: "assets/skills.png",
                                    subTitle:
                                        "Tu identifieras tes compétences clés et le domaine où tu excelleras naturellement.",
                                    title: "Tes compétences")
                                .animate()
                                .scale(curve: Curves.ease),
                            const InfosItem(
                                    icon: "assets/videos.png",
                                    subTitle:
                                        "À travers des vidéos, tu trouveras les filières qui te conviennent le mieux et où tu seras le plus épanoui.",
                                    title: "La meilleure filière pour toi")
                                .animate()
                                .scale(curve: Curves.ease),
                            const InfosItem(
                                    icon: "assets/interview.png",
                                    subTitle:
                                        "Tu bénéficieras d'un entretien personnalisé avec le campus pour t'aider à choisir la filière qui te convient le mieux",
                                    title: "Entretien personnalisé")
                                .animate()
                                .scale(curve: Curves.ease),
                          ],
                        ),
                      ),
                    ),

                    //commencer

                    SizedBox(
                      height: kHeight(context) * 0.65,
                      child: Center(
                          child: Stack(
                        children: [
                          Positioned(
                              top: kHeight(context) * 0.07,
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
                                            "Alors commençons le test de tempérament afin de connaitre ta personnalité.",
                                            speed: 40.milliseconds),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              DefaultBtn(
                  width: kWidth(context) * 0.9,
                  titleColor:
                      isSelect ? Colors.white : Colors.grey.withOpacity(0.3),
                  lighting: isSelect,
                  event: questionIndex == 8
                      ? () async {
                          fetchUserInfos();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  return;
                                },
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        kprimaryColor), // Changez la couleur ici
                                  ),
                                ),
                              );
                            },
                          );
                          ApiResponseModel response = await register(
                              user!.firstnameAndLastname,
                              user!.gender,
                              user!.phone,
                              user!.typeOfBac,
                              user!.bacYear,
                              user!.comeFromCountry,
                              user!.comeFromTown);
                          DatabaseManager.instance.updateUser(User(
                            id: response.data!['id'],
                            bacYear: response.data!['annee_bac'],
                            comeFromCountry: response.data!['pays_origine'],
                            comeFromTown: response.data!['ville_origine'],
                            firstnameAndLastname:
                                response.data!['nom_et_prenom'],
                            gender: response.data!['genre'],
                            phone: response.data!['phone'],
                            typeOfBac: response.data!['type_bac'],
                            dominantForceTemperament: "",
                            dominantWeaknessTemperament: "",
                            temperament: "",
                            skills: "",
                          ));

                          Navigator.pop(context);
                          showToast(response.message, ToastType.NORMAL);

                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.center,
                                  duration: 1000.milliseconds,
                                  curve: Curves.ease,
                                  reverseDuration: 1000.milliseconds,
                                  childCurrent: const RegisterInformations(),
                                  child: StartTemperamentTestView(
                                    user: User(
                                      id: response.data!['id'],
                                      bacYear: response.data!['annee_bac'],
                                      comeFromCountry:
                                          response.data!['pays_origine'],
                                      comeFromTown:
                                          response.data!['ville_origine'],
                                      firstnameAndLastname:
                                          response.data!['nom_et_prenom'],
                                      gender: response.data!['genre'],
                                      phone: response.data!['phone'],
                                      typeOfBac: response.data!['type_bac'],
                                      dominantForceTemperament: "",
                                      dominantWeaknessTemperament: "",
                                      temperament: "",
                                      skills: "",
                                    ),
                                  )));
                        }
                      : () {
                          if (questionIndex < 8 && isSelect == true) {
                            next(questionIndex + 1);
                          }
                        },
                  titleSize: 16,
                  title: questionIndex == 8 ? "C'EST PARTI" : "CONTINUER",
                  borderColor:
                      isSelect ? ktertiaryColor : const Color(0xFFE8E8EE),
                  bgColor: isSelect ? ktertiaryColor : const Color(0xFFE8E8EE)),
            ],
          ),
        ));
  }
}
