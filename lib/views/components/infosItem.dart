import 'package:flutter/material.dart';
import 'package:success/constants.dart';

class InfosItem extends StatelessWidget {
  const InfosItem(
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
      width: kWidth(context) * 0.8,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kHeight(context) * 0.04,
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
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: kHeight(context) * 0.008,
                ),
                Text(
                  subTitle,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
