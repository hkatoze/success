import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/services/local_db_sharepref.dart';
import 'package:success/views/resultScreen.dart';
import 'package:success/views/temperamentTestView.dart';

class FullPersonalityTest extends StatefulWidget {
  final User user;
  const FullPersonalityTest({super.key, required this.user});
  @override
  _FullPersonalityTestState createState() => _FullPersonalityTestState();
}

class _FullPersonalityTestState extends State<FullPersonalityTest> {
  @override
  Widget build(BuildContext context) {
    if (widget.user.dominantForceTemperament == "") {
      return TemperamentTestView(
        user: widget.user,
        qualifiers: forceQualifiers,
        onQuizCompleted: false,
        isForceOrFaiblesse: 'FORCES',
      );
    }

    if (widget.user.dominantWeaknessTemperament == "") {
      return TemperamentTestView(
        user: widget.user,
        qualifiers: faiblesseQualifiers,
        onQuizCompleted: false,
        isForceOrFaiblesse: 'FAIBLESSES',
      );
    }

    return ResultScreen(
      user: widget.user,
      dominantTemperament:
          '${widget.user.dominantForceTemperament} ${widget.user.dominantWeaknessTemperament}',
    );
  }
}
