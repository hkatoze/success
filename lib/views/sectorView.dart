import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:success/constants.dart';
import 'package:success/models/filiere.dart';
import 'package:success/views/components/defaultBtn.dart';
import 'package:success/views/videosList.dart';

class SectorView extends StatefulWidget {
  final Filiere filiere;
  const SectorView({super.key, required this.filiere});

  @override
  State<SectorView> createState() => _SectorViewState();
}

class _SectorViewState extends State<SectorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 35,
            ),
          ),
        ),
        body: SizedBox(
          height: kHeight(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 20,
                  child: Container(
                    width: kWidth(context) * 0.7,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: widget.filiere.departement == "ST"
                            ? ktertiaryColor.withOpacity(0.3)
                            : ksecondaryColor),
                    child: Text(
                      widget.filiere.nom,
                      maxLines: 2,
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  child: Text(
                    widget.filiere.description,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    "Après des études dans ce domaine vous pouvez envisager de travailler en tant que :",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var debouche in widget.filiere.perspectives)
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: widget.filiere.departement == "ST"
                                    ? ktertiaryColor.withOpacity(0.3)
                                    : ksecondaryColor,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                debouche,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: widget.filiere.departement == "ST"
                                  ? ktertiaryColor.withOpacity(0.3)
                                  : ksecondaryColor,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Text(
                              "etc...",
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultBtn(
                      width: kWidth(context) * 0.9,
                      titleColor: Colors.white,
                      lighting: true,
                      event: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.scale,
                                alignment: Alignment.center,
                                duration: const Duration(milliseconds: 500),
                                reverseDuration:
                                    const Duration(milliseconds: 500),
                                curve: Curves.ease,
                                childCurrent: SectorView(
                                  filiere: widget.filiere,
                                ),
                                child: Videoslist(
                                  filiere: widget.filiere,
                                )));
                      },
                      titleSize: 16,
                      title: "IMMERSION",
                      borderColor: ktertiaryColor,
                      bgColor: ktertiaryColor),
                )
              ],
            ),
          ),
        ));
  }
}
