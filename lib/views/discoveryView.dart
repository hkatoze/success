import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/partnerView.dart';

class DiscoveryView extends StatefulWidget {
  const DiscoveryView({super.key});

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: kHeight(context),
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: kHeight(context) * 0.05,
            ),
            const BoxItem(
              image: "assets/ist.jpeg",
              title: "IST AZIMMO OUAGA 2000",
              btnColor: ktertiaryColor,
              url: "https://www.facebook.com/Ouaga2000officiel/",
            ),
            const BoxItem(
              image: "assets/ELITE-1.jpg",
              title: "SALOMON CONSEILS",
              btnColor: kquinquinaryColor,
              url:
                  "https://www.facebook.com/p/Abdoul-Karim-BANDE-Officiel-100078088760907/",
            )
          ],
        ),
      ),
    ));
  }
}

class BoxItem extends StatelessWidget {
  const BoxItem(
      {super.key,
      required this.image,
      required this.title,
      required this.btnColor,
      required this.url});
  final String image;
  final String title;
  final Color btnColor;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kHeight(context) * .475,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.transparent, Colors.white.withOpacity(0.9)],
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(100.0),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.bold, color: btnColor),
              ),
              SizedBox(
                height: kHeight(context) * 0.05,
              ),
              SizedBox(
                width: kWidth(context) * 0.8,
                child: DefaultBtn(
                    width: kWidth(context) * 0.9,
                    titleColor: Colors.white,
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
                              childCurrent: const DiscoveryView(),
                              child: WebviewPage(
                                  partnerUrl: url,
                                  bgColor: btnColor,
                                  title: title)));
                    },
                    titleSize: 16,
                    title: "DECOUVRIR",
                    bgColor: btnColor),
              )
            ]),
          )
        ],
      ),
    );
  }
}
