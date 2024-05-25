import 'package:flutter/material.dart';

import 'package:success/constants.dart';
import 'package:success/models/user.dart';

class MeetingView extends StatefulWidget {
  final User user;
  const MeetingView({super.key, required this.user});

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "Rencontre avec le Campus",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
            ],
          ),
          SizedBox(
            height: kHeight(context) * 0.01,
          )
        ],
      ),
    ));
  }
}
