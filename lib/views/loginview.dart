import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:flutter_chat_bubble/chat_bubble.dart";
import "package:lottie/lottie.dart";
import "package:page_transition/page_transition.dart";

import "package:success/constants.dart";
import "package:success/services/api_services.dart";
import "package:success/views/checkLoginCodeView.dart";
import "package:success/views/components/defaultBtn.dart";
import "package:success/views/components/defaultTextField.dart";

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  final phoneController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    super.initState();
    phoneController.addListener(() {
      if (phoneController.text != "") {
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
                    "Connexion",
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
                                "Renseigne ton numéro de téléphone pour recevoir le code d'authentification.",
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
              Container(
                width: kWidth(context) * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: DefaultTextField(
                    controller: phoneController,
                    withBorder: false,
                    action: TextInputAction.done,
                    hintText: "Téléphone (sans indicatif)",
                    keyboardType: TextInputType.phone,
                    width: kWidth(context)),
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
                    final response = await login(phoneController.text);
                    Navigator.pop(context);

                    if (response.message ==
                        "Un code de vérification a été envoyé sur votre numéro de téléphone.") {
                      showToast(response.message, ToastType.SUCCESS);
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeftJoined,
                              duration: 1000.milliseconds,
                              curve: Curves.ease,
                              reverseDuration: 1000.milliseconds,
                              childCurrent: const Loginview(),
                              child: CheckLoginCodeView(
                                phone: phoneController.text,
                              )));
                    } else {
                      showToast(response.message, ToastType.ERROR);
                    }
                  },
                  titleSize: 16,
                  title: "SE CONNECTER",
                  borderColor:
                      isEdit ? ktertiaryColor : const Color(0xFFE8E8EE),
                  bgColor: isEdit ? ktertiaryColor : const Color(0xFFE8E8EE)),
              SizedBox(
                height: kHeight(context) * 0.01,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: "En te connectant sur Success, tu acceptes nos ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: 'DINNextRoundedLTProMedium',
                      ),
                      children: [
                        TextSpan(
                            text: "Conditions d'utilisation ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "et notre "),
                        TextSpan(
                            text: "Politique de confidentialité.",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
              SizedBox(
                height: kHeight(context) * 0.01,
              )
            ],
          ),
        ));
  }
}
