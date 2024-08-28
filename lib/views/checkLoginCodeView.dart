import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:success/constants.dart';
import 'package:success/models/apiResponseModel.dart';
import 'package:success/models/user.dart';
import 'package:success/services/api_services.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/mainview.dart';

class CheckLoginCodeView extends StatefulWidget {
  const CheckLoginCodeView({super.key, required this.phone});
  final String phone;

  @override
  State<CheckLoginCodeView> createState() => _CheckLoginCodeViewState();
}

class _CheckLoginCodeViewState extends State<CheckLoginCodeView> {
  final _codeController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();

    _codeController.addListener(() {
      if (_codeController.text != "") {
        setState(() {
          isEdit = true;
        });
      } else {
        setState(() {
          isEdit = false;
        });
      }
    });
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
                    "Code de Vérification",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
              SizedBox(
                height: kHeight(context) * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: kWidth(context) * 0.35,
                  ),
                  ChatBubble(
                    backGroundColor: const Color(0xFFE8E8EE),
                    clipper:
                        ChatBubbleClipper3(type: BubbleType.receiverBubble),
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
                                "Entre le code que tu as reçu sur ton numéro de téléphone",
                                speed: 40.milliseconds),
                          ],
                        ),
                      ),
                    ),
                  ).animate().scale(curve: Curves.bounceInOut)
                ],
              ),
              Center(
                child: Lottie.asset('assets/lotties/mascotte.json',
                    height: kHeight(context) * 0.15),
              ),
              SizedBox(
                height: kHeight(context) * 0.1,
              ),
              SizedBox(
                width: kWidth(context) * 0.9,
                child: Center(
                  child: PinCodeTextField(
                    controller: _codeController,
                    pinTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    pinBoxColor: kprimaryColor,
                    autofocus: true,
                    pinBoxOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 3),
                    highlight: true,
                    highlightColor: kquaternaryColor,
                    defaultBorderColor: kprimaryColor,
                    hasTextBorderColor: kprimaryColor,
                    highlightPinBoxColor: kprimaryColor,
                    maxLength: 6,
                    pinBoxRadius: 8,
                    pinBoxHeight: 38,
                    pinBoxWidth: 38,
                    wrapAlignment: WrapAlignment.spaceBetween,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(child: SizedBox()),
              DefaultBtn(
                  width: kWidth(context) * 0.9,
                  titleColor:
                      isEdit ? Colors.white : Colors.grey.withOpacity(0.3),
                  lighting: isEdit,
                  event: () async {
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
                    ApiResponseModel response = await checkCodeForLogin(
                        widget.phone, _codeController.text);
                    Navigator.pop(context);

                    if (response.message == "Connexion réussie !") {
                      DatabaseManager.instance.addUser(User(
                        id: response.data!['id'],
                        bacYear: response.data!['annee_bac'],
                        comeFromCountry: response.data!['pays_origine'],
                        comeFromTown: response.data!['ville_origine'],
                        firstnameAndLastname: response.data!['nom_et_prenom'],
                        gender: response.data!['genre'],
                        phone: response.data!['phone'],
                        typeOfBac: response.data!['type_bac'],
                        dominantForceTemperament:
                            response.data!['dominantForceTemperament'] ?? "",
                        dominantWeaknessTemperament:
                            response.data!['dominantWeaknessTemperament'] ?? "",
                        temperament: response.data!['temperament'] ?? "",
                        skills: response.data!['skills'] ?? "",
                      ));
                      showToast(response.message, ToastType.SUCCESS);

                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRightJoined,
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              childCurrent: CheckLoginCodeView(
                                phone: widget.phone,
                              ),
                              child: Mainview(
                                user: User(
                                  id: response.data!['id'],
                                  bacYear: response.data!['annee_bac'],
                                  comeFromCountry:
                                      response.data!['pays_origine'],
                                  comeFromTown: response.data!['ville_origine'],
                                  firstnameAndLastname:
                                      response.data!['nom_et_prenom'],
                                  gender: response.data!['genre'],
                                  phone: response.data!['phone'],
                                  typeOfBac: response.data!['type_bac'],
                                  dominantForceTemperament: response
                                          .data!['dominantForceTemperament'] ??
                                      "",
                                  dominantWeaknessTemperament: response.data![
                                          'dominantWeaknessTemperament'] ??
                                      "",
                                  temperament:
                                      response.data!['temperament'] ?? "",
                                  skills: response.data!['skills'] ?? "",
                                ),
                              )));
                    } else {
                      showToast(response.message, ToastType.ERROR);
                    }
                  },
                  titleSize: 16,
                  title: "VERIFIER",
                  borderColor:
                      isEdit ? ktertiaryColor : const Color(0xFFE8E8EE),
                  bgColor: isEdit ? ktertiaryColor : const Color(0xFFE8E8EE)),
              SizedBox(
                height: kHeight(context) * 0.01,
              )
            ],
          ),
        ));
  }
}
