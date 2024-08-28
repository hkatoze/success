import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/fullPersonalityTest.dart';
import 'package:success/views/homeView.dart';
import 'package:success/views/meetingView.dart';
import 'package:success/views/sectorsListview.dart';
import 'package:success/views/startSkillsTestView.dart';
import 'package:success/views/startTemperamentTestView.dart';
import 'package:super_tooltip/super_tooltip.dart';

class CircleAvatarIndicator extends StatelessWidget {
  final Color _backgroundColor;
  final String _img;
  final bool animate;
  final double progress;
  final bool isLast;
  final String title;
  final User user;

  const CircleAvatarIndicator(this.title, this._backgroundColor, this._img,
      this.progress, this.animate, this.isLast, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 150,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 115,
                  height: 115,
                  child: CircularProgressIndicator(
                    strokeWidth: 13,
                    value: progress,
                    backgroundColor: kprimaryColor,
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 85,
                  child: CircleAvatar(
                    backgroundColor: _backgroundColor,
                    radius: 56,
                    child: Image.asset(
                      _img,
                      height: 58,
                    ),
                  ),
                ),
              ),
              if (animate)
                Positioned(
                  top: 0,
                  child: BouncingTextWidget(
                    isLast: isLast,
                    title: title,
                    user: user,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class BouncingTextWidget extends StatefulWidget {
  final bool isLast;
  final String title;
  final User user;
  const BouncingTextWidget(
      {Key? key, required this.isLast, required this.title, required this.user})
      : super(key: key);

  @override
  _BouncingTextWidgetState createState() => _BouncingTextWidgetState();
}

class _BouncingTextWidgetState extends State<BouncingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const double _bounceHeight = 10.0;
  static const int _millisecondsPerBounce = 2000;
  bool showBtn = true;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _millisecondsPerBounce),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _controllerTooltip = SuperTooltipController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final double value = sin(_controller.value * pi);
        final double height = value * _bounceHeight;
        return Transform.translate(
          offset: Offset(0, height),
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(7),
            child: GestureDetector(
              onTap: () async {
                await _controllerTooltip.showTooltip();
              },
              child: SuperTooltip(
                showBarrier: false,
                popupDirection:
                    widget.isLast ? TooltipDirection.up : TooltipDirection.down,
                hasShadow: false,
                arrowLength: 10,
                arrowTipDistance: widget.isLast ? 30 : 120,
                borderColor: ktertiaryColor,
                backgroundColor: ktertiaryColor,
                controller: _controllerTooltip,
                fadeInDuration: 1000.milliseconds,
                hideTooltipOnTap: true,
                borderWidth: 2.0,
                borderRadius: 15.0,
                onShow: () {
                  setState(() {
                    showBtn = false;
                  });
                },
                onHide: () {
                  setState(() {
                    showBtn = true;
                  });
                },
                content: SizedBox(
                  width: kWidth(context) * 0.7,
                  height: 150,
                  child: widget.title == "TEMPERAMENT"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              const Text(
                                "Test de tempérament",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                " ${widget.user.dominantForceTemperament != "" && widget.user.dominantWeaknessTemperament == "" ? "Termine ton test de tempérament afin de connaitre ta personnalité." : (widget.user.dominantForceTemperament == "" && widget.user.dominantWeaknessTemperament == "") ? "Découvre ton tempérament , ton vrai moi" : widget.user.dominantForceTemperament == "" && widget.user.dominantWeaknessTemperament != "" ? "Termine ton test de tempérament afin de connaitre ta personnalité." : "Clique sur voir pour découvrir ta personnalité."}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              Expanded(child: Container()),
                              DefaultBtn(
                                  width: double.infinity,
                                  titleColor: ktertiaryColor,
                                  event: () {
                                    _controllerTooltip.hideTooltip();
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.scale,
                                            alignment: Alignment.center,
                                            duration: const Duration(
                                                milliseconds: 900),
                                            reverseDuration: const Duration(
                                                milliseconds: 900),
                                            curve: Curves.ease,
                                            childCurrent: Homeview(
                                              user: widget.user,
                                            ),
                                            child: widget.user
                                                            .dominantForceTemperament !=
                                                        "" &&
                                                    widget.user
                                                            .dominantWeaknessTemperament !=
                                                        ""
                                                ? FullPersonalityTest(
                                                    user: widget.user,
                                                    isUpdate: true,
                                                  )
                                                : StartTemperamentTestView(
                                                    user: widget.user,
                                                  )));
                                  },
                                  titleSize: 16,
                                  title: "C'EST PARTI",
                                  lighting: false,
                                  bgColor: Colors.white),
                            ])
                      : (widget.title == "COMPETENCES"
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  const Text(
                                    "Test de compétences",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Découvre tes compétences clés et le domaine ou tu excellera naturellement",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Expanded(child: Container()),
                                  DefaultBtn(
                                      width: double.infinity,
                                      titleColor: ktertiaryColor,
                                      event: () {
                                        _controllerTooltip.hideTooltip();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.scale,
                                                alignment: Alignment.center,
                                                duration: const Duration(
                                                    milliseconds: 900),
                                                reverseDuration: const Duration(
                                                    milliseconds: 900),
                                                curve: Curves.ease,
                                                childCurrent:
                                                    Homeview(user: widget.user),
                                                child: StartSkillsTestView(
                                                    user: widget.user)));
                                      },
                                      titleSize: 16,
                                      title: "C'EST PARTI",
                                      lighting: false,
                                      bgColor: Colors.white),
                                ])
                          : (widget.title == "FILIERES"
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      const Text(
                                        "La meilleure filière pour toi",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Découvre à travers des vidéos les filières qui te sont adaptées et dans lesquelles tu seras le plus épanoui",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Expanded(child: Container()),
                                      DefaultBtn(
                                          width: double.infinity,
                                          titleColor: ktertiaryColor,
                                          event: () {
                                            _controllerTooltip.hideTooltip();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .scale,
                                                    alignment: Alignment.center,
                                                    duration: const Duration(
                                                        milliseconds: 900),
                                                    reverseDuration:
                                                        const Duration(
                                                            milliseconds: 900),
                                                    curve: Curves.ease,
                                                    childCurrent: Homeview(
                                                      user: widget.user,
                                                    ),
                                                    child: SectorsListview(
                                                      user: widget.user,
                                                    )));
                                          },
                                          titleSize: 16,
                                          title: "DECOUVRIR",
                                          lighting: false,
                                          bgColor: Colors.white),
                                    ])
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      const Text(
                                        "Entretien personnalisé",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Bénéficie d'un entretien personnalisé avec le campus afin de choisir la filière qui te convient le mieux",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      Expanded(child: Container()),
                                      DefaultBtn(
                                          width: double.infinity,
                                          titleColor: ktertiaryColor,
                                          event: () {
                                            _controllerTooltip.hideTooltip();
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .scale,
                                                    alignment: Alignment.center,
                                                    duration: const Duration(
                                                        milliseconds: 900),
                                                    reverseDuration:
                                                        const Duration(
                                                            milliseconds: 900),
                                                    curve: Curves.ease,
                                                    childCurrent: Homeview(
                                                        user: widget.user),
                                                    child: MeetingView(
                                                      user: widget.user,
                                                    )));
                                          },
                                          titleSize: 16,
                                          title: "C'EST PARTI",
                                          lighting: false,
                                          bgColor: Colors.white),
                                    ]))),
                ),
                child: showBtn
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          widget.user.dominantForceTemperament != "" && widget.user.dominantWeaknessTemperament == "" ? "CONTINUER" : (widget.user.dominantForceTemperament == "" && widget.user.dominantWeaknessTemperament == "") ? "COMMENCER" : widget.user.dominantForceTemperament == "" && widget.user.dominantWeaknessTemperament != "" ? "CONTINUER" : "VOIR",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: ktertiaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ).animate().fade(duration: 1000.milliseconds)
                    : Container(
                        height: 0,
                        width: 120,
                        color: Colors.transparent,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
