import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:success/models/user.dart';

import 'package:success/services/local_db_services.dart';
import 'package:success/views/mainview.dart';
import 'package:success/views/introduceView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SuccessApp());
}

class SuccessApp extends StatefulWidget {
  const SuccessApp({super.key});

  @override
  State<SuccessApp> createState() => _SuccessAppState();
}

class _SuccessAppState extends State<SuccessApp> {
  User? user;
  bool isConnect = false;

  @override
  void initState() {
    super.initState();
    fetchUserInfos();
  }

  void fetchUserInfos() async {
    final User? loggedUser = await DatabaseManager.instance.getLoggedUser();

    debugPrint("----------------$loggedUser ---------------------------");
    if (loggedUser == null) {
      setState(() {
        isConnect = false;
      });
    } else {
      setState(() {
        isConnect = true;
        user = loggedUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: "DINNextRoundedLTProMedium"),
      dark: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          fontFamily: "DINNextRoundedLTProMedium"),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'SUCCESS',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home: isConnect
            ? Mainview(
                user: user!,
              )
            : const IntroduceView(),
      ),
    );
  }
}
