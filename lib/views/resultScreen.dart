import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/personalityTestResult.dart';
import 'package:success/models/user.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/services/local_db_sharepref.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/mainview.dart';
import 'package:success/views/sectorsListview.dart';
import 'package:success/views/startTemperamentTestView.dart';

class ResultScreen extends StatefulWidget {
  final String dominantTemperament;
  final User user;

  const ResultScreen(
      {super.key, required this.dominantTemperament, required this.user});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  User? newUser;
  void confirmResetPopup() {
    AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.warning,
            btnOkColor: kquinquinaryColor,
            btnCancelColor: ktertiaryColor,
            btnCancelText: "ANNULER",
            btnOkText: "CONTINUER",
            body: Center(
              child: SizedBox(
                height: 170,
                child: Column(
                  children: [
                    const Text(
                      "ATTENTION",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kprimaryColor, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        "Refaire un autre test signifie que le resultat de votre dernier test sera perdu et remplacé par celui que vous êtes sur le point de faire.\nVoulez-vous continuer ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            btnOkOnPress: () async {
              updateUser(User(
                id: widget.user.id,
                bacYear: widget.user.bacYear,
                comeFromCountry: widget.user.comeFromCountry,
                comeFromTown: widget.user.comeFromTown,
                firstnameAndLastname: widget.user.firstnameAndLastname,
                gender: widget.user.gender,
                phone: widget.user.phone,
                typeOfBac: widget.user.typeOfBac,
                dominantForceTemperament: "",
                dominantWeaknessTemperament: "",
                temperament: "",
                skills: widget.user.skills,
              ));

              final user = await getLoggedUser();

              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: 1000.milliseconds,
                      curve: Curves.ease,
                      reverseDuration: 1000.milliseconds,
                      childCurrent: ResultScreen(
                        dominantTemperament: widget.dominantTemperament,
                        user: widget.user,
                      ),
                      child: StartTemperamentTestView(
                          user: user == null ? widget.user : user)));
            },
            btnCancelOnPress: () {})
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightJoined,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      childCurrent: ResultScreen(
                        user: widget.user,
                        dominantTemperament: widget.dominantTemperament,
                      ),
                      child: Mainview(
                        user: widget.user,
                      )));
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 35,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "RESULTAT DU TEST DE TEMPERAMENT",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          height: kHeight(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Container(
                        height: 340,
                        width: kWidth(context) * 0.95,
                        decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: CircleAvatar(
                                  radius: 85,
                                  backgroundColor: Colors.white.withOpacity(.3),
                                  child: CircleAvatar(
                                    radius: 71,
                                    backgroundColor:
                                        Colors.white.withOpacity(.4),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                          child: Center(
                                        child: Lottie.asset(
                                            'assets/lotties/mascotte.json',
                                            height: 80),
                                      )),
                                    ),
                                  )),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Tu as le tempérament d'un ",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19)),
                                  NeonText(
                                    text: widget.dominantTemperament,
                                    fontWeight: FontWeight.bold,
                                    textColor: kquinquinaryColor,
                                    spreadColor: ktertiaryColor,
                                    blurRadius: 15,
                                    textSize: 19,
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Positioned(
                        bottom: 20,
                        left: kWidth(context) * 0.05,
                        right: kWidth(context) * 0.05,
                        child: Container(
                          height: 300,
                          width: kWidth(context) * 0.90,
                          padding:
                              EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                    color: kprimaryColor.withOpacity(.7))
                              ]),
                          child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Qu'est ce que cela signifie ?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  getDescriptionByTemperament(
                                      widget.dominantTemperament),
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ])),
                        )),
                  ]),
                ),
                DefaultBtn(
                    width: kWidth(context) * 0.9,
                    titleColor: Colors.white,
                    lighting: true,
                    event: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.center,
                              duration: const Duration(milliseconds: 900),
                              reverseDuration:
                                  const Duration(milliseconds: 900),
                              curve: Curves.ease,
                              childCurrent: ResultScreen(
                                user: widget.user,
                                dominantTemperament: widget.dominantTemperament,
                              ),
                              child: SectorsListview(
                                user: widget.user,
                              )));
                    },
                    titleSize: 16,
                    title: "DECOUVRIR MES FILIRES",
                    borderColor: ktertiaryColor,
                    bgColor: ktertiaryColor),
                const SizedBox(
                  height: 10,
                ),
                DefaultBtn(
                    width: kWidth(context) * 0.9,
                    titleColor: Colors.white,
                    lighting: false,
                    event: () {
                      confirmResetPopup();
                    },
                    titleSize: 16,
                    title: "REFAIRE LE TEST",
                    borderColor: ksecondaryColor,
                    bgColor: ksecondaryColor)
              ],
            ),
          ),
        ));
  }
}
