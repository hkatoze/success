import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/main.dart';
import 'package:success/models/user.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/views/mainview.dart';

class ProfilView extends StatefulWidget {
  final User user;
  const ProfilView({super.key, required this.user});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  void confirmLogoutPopup() {
    AwesomeDialog(
            context: context,
            animType: AnimType.scale,
            dialogType: DialogType.warning,
            btnOkColor: kquinquinaryColor,
            dismissOnTouchOutside: false,
            btnCancelColor: ktertiaryColor,
            btnCancelText: "ANNULER",
            btnOkText: "OUI",
            body: Center(
              child: SizedBox(
                height: 110,
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
                        "Voulez-vous vraiment vous déconnecter?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            btnOkOnPress: () async {
              await DatabaseManager.instance.clearDatabase();
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRightJoined,
                      duration: const Duration(milliseconds: 500),
                      reverseDuration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      childCurrent: Mainview(
                        user: widget.user,
                      ),
                      child: const SuccessApp()));
            },
            btnCancelOnPress: () {})
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: kprimaryColor,
                            ),
                            height: 200,
                            width: kWidth(context),
                          )),
                      Positioned(
                          bottom: 100,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            height: 70,
                            width: kWidth(context) * 0.6,
                          )),
                      Positioned(
                          top: 100,
                          left: -5,
                          child: Transform.rotate(
                              angle: -0.40, // L'angle de rotation en radians
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: kprimaryColor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30))),
                                height: 100,
                                width: kWidth(context),
                              ))),
                      Positioned(
                          top: 45,
                          left: 0,
                          child: Container(
                            width: kWidth(context) * 0.6,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.user.firstnameAndLastname
                                      .toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  widget.user.phone,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w100),
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          bottom: 60,
                          right: kWidth(context) * 0.15,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: kprimaryColor.withOpacity(.4))
                                ]),
                            child: Center(
                                child: Lottie.asset(
                                    widget.user.gender == "HOMME"
                                        ? 'assets/lotties/male-avatar.json'
                                        : 'assets/lotties/female-avatar.json',
                                    height: 120)),
                          )),
                      Positioned(
                          bottom: 10,
                          right: kWidth(context) * 0.26,
                          child: GestureDetector(
                            onTap: () async {
                              confirmLogoutPopup();
                            },
                            child: const Icon(
                              Icons.logout,
                              color: kquinquinaryColor,
                              size: 35,
                            ),
                          ))
                    ],
                  )),
              Center(
                child: Container(
                    width: double.infinity,
                    height: kHeight(context) - 365,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: <ProfilInfosItem>[
                        ProfilInfosItem(
                            icon: "assets/name.png",
                            subTitle:
                                widget.user.firstnameAndLastname.toUpperCase(),
                            title: "NOM ET PRENOM"),
                        ProfilInfosItem(
                            icon: "assets/phone.png",
                            subTitle: widget.user.phone,
                            title: "TELEPHONE"),
                        ProfilInfosItem(
                            icon: "assets/gender.png",
                            subTitle: widget.user.gender,
                            title: "GENRE"),
                        ProfilInfosItem(
                            icon: "assets/graduate.png",
                            subTitle: widget.user.typeOfBac,
                            title: "TYPE DE BAC"),
                        ProfilInfosItem(
                            icon: "assets/school-year.png",
                            subTitle: widget.user.bacYear,
                            title: "ANNEE DU BAC"),
                        ProfilInfosItem(
                            icon: "assets/country.png",
                            subTitle: widget.user.comeFromCountry,
                            title: "PAYS D'ORIGINE"),
                        ProfilInfosItem(
                            icon: "assets/town.png",
                            subTitle: widget.user.comeFromTown,
                            title: "VILLE D'ORIGINE"),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

class ProfilInfosItem extends StatelessWidget {
  const ProfilInfosItem(
      {super.key,
      required this.icon,
      required this.subTitle,
      required this.title});
  final String title;
  final String subTitle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: Image.asset(icon),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: kWidth(context) * 0.63,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
