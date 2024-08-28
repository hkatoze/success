import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'dart:math';

import 'package:success/constants.dart';

import 'package:success/views/registerView.dart';

class IntroduceView extends StatefulWidget {
  const IntroduceView({super.key});

  @override
  State<IntroduceView> createState() => _IntroduceViewState();
}

class _IntroduceViewState extends State<IntroduceView> {
  final controller = PageController();
  final getDataPagecontroller = PageController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final bacTypeontroller = TextEditingController();
  final bacYearController = TextEditingController();
  final countryComeFromController = TextEditingController();
  final streetController = TextEditingController();
  final schoolController = TextEditingController();
  double boxHeight = 520;
  double marginTop = 0.2;
  int pageIndex = 1;
  int formIndex = 0;
  bool isRegistring = false;

  void toPage(int page) {
    controller.animateToPage(page,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  void toPageOfForm(int page) {
    getDataPagecontroller.animateToPage(page,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            height: kHeight(context),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Positioned(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        SizedBox(
                          height: kHeight(context) * 0.1,
                        ),
                        const Text(
                          "Tempérament",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: kquinquinaryColor),
                        )
                            .animate()
                            .then(
                              delay: 2.8.seconds,
                            )
                            .slideY(
                                end: 6,
                                duration: 0.9.seconds,
                                curve: Curves.easeOut),
                        SizedBox(
                          height: kHeight(context) * 0.35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const RotatedBox(
                              quarterTurns:
                                  3, // rotation de 90 degrés dans le sens horaire
                              child: Text(
                                "Succès",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: kprimaryColor),
                              ),
                            )
                                .animate()
                                .then(
                                  delay: 2.8.seconds,
                                )
                                .slideX(
                                    end: 2,
                                    duration: 0.9.seconds,
                                    curve: Curves.easeOut),
                            const RotatedBox(
                              quarterTurns: 9,
                              child: Text(
                                "Filières",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ktertiaryColor),
                              ),
                            )
                                .animate()
                                .then(
                                  delay: 2.8.seconds,
                                )
                                .slideX(
                                    end: -2,
                                    duration: 0.9.seconds,
                                    curve: Curves.easeOut),
                          ],
                        ),
                        SizedBox(
                          height: kHeight(context) * 0.3,
                        ),
                        const Text(
                          "Compétence",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: kquaternaryColor),
                        )
                            .animate()
                            .then(
                              delay: 2.8.seconds,
                            )
                            .slideY(
                                end: -6,
                                duration: 0.9.seconds,
                                curve: Curves.easeOut),
                      ])),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130),
                      child: const DiagonallySplitCircleAvatar(
                        backgroundColor: kprimaryColor,
                        foregroundColor: ksecondaryColor,
                        radius: 100.0,
                      )
                          .animate()
                          .slideY(begin: -0.5, end: 0.2, duration: 0.9.seconds)
                          .then(
                            delay: 200.milliseconds,
                          )
                          .slideY(
                            end: -0.3,
                            duration: 0.9.seconds,
                          )
                          .then(delay: 200.milliseconds)
                          .slideY(end: 0.1, duration: 0.5.seconds)
                          .then(delay: 1.3.seconds),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    heightFactor: 1,
                    widthFactor: 1,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      child: AnimatedContainer(
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 700),
                        height: kHeight(context),
                        width: kWidth(context),
                        color: Colors.transparent,
                        child: const RegisterView(),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(
                          delay: 3.7.seconds,
                          duration: 1000.milliseconds,
                          curve: Curves.ease)
                      .scale(
                        duration: 1000.milliseconds,
                        curve: Curves.ease,
                      ),
                ],
              ),
            )));
  }
}

class DiagonallySplitCircleAvatar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double radius;

  const DiagonallySplitCircleAvatar({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[
            backgroundColor,
            backgroundColor,
            foregroundColor,
            foregroundColor,
          ],
          stops: const [0.0, 0.5, 0.5, 1.0],
          transform: const GradientRotation(25.0 * pi / 180.0),
        ).createShader(bounds);
      },
      child: CircleAvatar(
        radius: radius,
      ),
    );
  }
}
