import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/views/components/circle_avatar.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key, required this.user});
  final User user;

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  Text _textCirle(String text) => Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      );

  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    debugPrint('DomimantForceTemp: ${widget.user.dominantWeaknessTemperament}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 750,
            width: kWidth(context),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: kWidth(context) * 0.2,
                    right: kWidth(context) * 0.2,
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                child: CircleAvatarIndicator(
                                    "TEMPERAMENT",
                                    const Color(0xFF55acf3),
                                    "assets/personnality.png",
                                    widget.user.dominantForceTemperament !=
                                                "" &&
                                            widget.user
                                                    .dominantWeaknessTemperament ==
                                                ""
                                        ? 0.5
                                        : (widget.user.dominantForceTemperament ==
                                                    "" &&
                                                widget.user
                                                        .dominantWeaknessTemperament ==
                                                    "")
                                            ? 0
                                            : widget.user.dominantForceTemperament ==
                                                        "" &&
                                                    widget.user
                                                            .dominantWeaknessTemperament !=
                                                        ""
                                                ? 0.5
                                                : 1,
                                    selectedIndex == 1,
                                    false,
                                    widget.user)),
                            const SizedBox(height: 10),
                            _textCirle("TEMPERAMENT"),
                          ],
                        ))),
                /*        Positioned(
                  top: 200,
                  left: kWidth(context) * 0,
                  right: kWidth(context) * 0.35,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            child: CircleAvatarIndicator(
                                "COMPETENCES",
                                const Color(0xFF55acf3),
                                "assets/skills.png",
                                0,
                                selectedIndex == 2,
                                false,
                                widget.user)),
                        const SizedBox(height: 10),
                        _textCirle("COMPETENCES"),
                      ],
                    ),
                  ),
                ) */
                Positioned(
                  top: 250,
                  left: kWidth(context) * 0,
                  right: kWidth(context) * 0.35,
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 3;
                                });
                              },
                              child: CircleAvatarIndicator(
                                  "FILIERES",
                                  const Color(0xFF55acf3),
                                  "assets/videos.png",
                                  widget.user.dominantForceTemperament != "" &&
                                          widget.user
                                                  .dominantWeaknessTemperament ==
                                              ""
                                      ? 0.5
                                      : (widget.user.dominantForceTemperament ==
                                                  "" &&
                                              widget.user
                                                      .dominantWeaknessTemperament ==
                                                  "")
                                          ? 0
                                          : widget.user.dominantForceTemperament ==
                                                      "" &&
                                                  widget.user
                                                          .dominantWeaknessTemperament !=
                                                      ""
                                              ? 0.5
                                              : 1,
                                  selectedIndex == 3,
                                  false,
                                  widget.user)),
                          const SizedBox(height: 10),
                          _textCirle("FILIERES"),
                        ],
                      )),
                ),
                Positioned(
                  top: 470,
                  left: kWidth(context) * 0,
                  right: kWidth(context) * 0,
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 4;
                                });
                              },
                              child: CircleAvatarIndicator(
                                  "ENTRETIEN",
                                  const Color(0xFF55acf3),
                                  "assets/interview.png",
                                  widget.user.dominantForceTemperament != "" &&
                                          widget.user
                                                  .dominantWeaknessTemperament ==
                                              ""
                                      ? 0.5
                                      : (widget.user.dominantForceTemperament ==
                                                  "" &&
                                              widget.user
                                                      .dominantWeaknessTemperament ==
                                                  "")
                                          ? 0
                                          : widget.user.dominantForceTemperament ==
                                                      "" &&
                                                  widget.user
                                                          .dominantWeaknessTemperament !=
                                                      ""
                                              ? 0.5
                                              : 1,
                                  selectedIndex == 4,
                                  true,
                                  widget.user)),
                          const SizedBox(height: 10),
                          _textCirle("ENTRETIEN"),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
