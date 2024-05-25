import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:success/constants.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(8),
      height: kHeight(context),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 521,
              width: double.infinity,
              child: Stack(alignment: Alignment.topCenter, children: [
                Container(
                    height: 340,
                    width: kWidth(context) * 0.95,
                    decoration: BoxDecoration(
                        color: const Color(0XFFA42FC1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: CircleAvatar(
                          radius: 85,
                          backgroundColor: Colors.white.withOpacity(.3),
                          child: CircleAvatar(
                            radius: 71,
                            backgroundColor: Colors.white.withOpacity(.4),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Your Score",
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFFA42FC1)),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                        text: "100",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFA42FC1),
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: " pt",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFFA42FC1),
                                              ))
                                        ]),
                                  )
                                ],
                              )),
                            ),
                          )),
                    )),
                Positioned(
                    bottom: 60,
                    left: kWidth(context) * 0.05,
                    right: kWidth(context) * 0.05,
                    child: Container(
                      height: 190,
                      width: kWidth(context) * 0.90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 3,
                                color: const Color(0xFFA42FC1).withOpacity(.7))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 5),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFA42FC1)),
                                              ),
                                              const Text(
                                                "100%",
                                                style: TextStyle(
                                                    color: Color(0xFFA42FC1),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          "Completion",
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 15,
                                                width: 15,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xFFA42FC1)),
                                              ),
                                              const Text(
                                                "10",
                                                style: TextStyle(
                                                    color: Color(0xFFA42FC1),
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          "Total Question",
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.green),
                                                ),
                                                const Text(
                                                  " 07",
                                                  style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            "Correct",
                                            style: TextStyle(),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.red),
                                                ),
                                                const Text(
                                                  " 03",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Text(
                                            "Wrong",
                                            style: TextStyle(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ),
                    )),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
