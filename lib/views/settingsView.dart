import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:success/constants.dart';
import 'package:success/views/components/defaultBtn.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  AdaptiveThemeMode themeMode = AdaptiveThemeMode.system;

  Future<void> call(String recipient) async {
    await FlutterPhoneDirectCaller.callNumber(recipient);
  }

  void _toggleTheme(AdaptiveThemeMode themeMode) {
    setState(() {
      themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = AdaptiveTheme.of(context).brightness == Brightness.dark;
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
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/setiings-back.png")),
                            ),
                            height: 200,
                            width: kWidth(context),
                          )),
                      Positioned(
                          bottom: 60,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: kWidth(context) * 0.05),
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    opacity: 0.5,
                                    image: AssetImage(
                                        "assets/images/samourai.png")),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: kprimaryColor.withOpacity(.4))
                                ]),
                          )),
                      Positioned(
                        bottom: 60,
                        right: 0,
                        left: 0,
                        child: Container(
                            height: 120,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            margin: EdgeInsets.symmetric(
                                horizontal: kWidth(context) * 0.05),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      spreadRadius: 3,
                                      color: kprimaryColor.withOpacity(.4))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Contactez le Campus",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Directement",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    DefaultBtn(
                                        width: kWidth(context) * 0.3,
                                        radius: 23,
                                        lighting: false,
                                        titleColor: Colors.black,
                                        event: () async {
                                          await call("+22651306464");
                                        },
                                        titleSize: 17,
                                        title: "Appeler",
                                        borderColor: Colors.white,
                                        bgColor: Colors.white)
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  height: kHeight(context) - 365,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const Text(
                        "Général",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 17),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                            )),
                        child: Column(children: [
                          SettingItem(
                              icon: Icons.security,
                              event: () {},
                              title: "Sécurité"),
                          SettingItem(
                              icon: Icons.language,
                              event: () {},
                              title: "Langue"),
                          SettingItem(
                              icon: Icons.sunny,
                              event: () {},
                              isSwitchBtn: true,
                              switchbtn: Switch(
                                value: isDarkMode,
                                onChanged: (isOn) {
                                  debugPrint(isOn.toString());
                                  isOn
                                      ? AdaptiveTheme.of(context).setDark()
                                      : AdaptiveTheme.of(context).setLight();
                                },
                              ),
                              title: "Mode sombre"),
                        ]),
                      ),
                      const Text(
                        "A propos de l'App",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 17),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                            )),
                        child: Column(children: [
                          SettingItem(
                              icon: Icons.shield,
                              event: () {},
                              title: "Privacy Policy"),
                          SettingItem(
                              icon: Icons.help_rounded,
                              event: () {},
                              title: "About App"),
                          SettingItem(
                              icon: Icons.add_box, event: () {}, title: "More"),
                        ]),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}

class SettingItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function event;
  final bool isSwitchBtn;
  final Widget switchbtn;
  const SettingItem(
      {super.key,
      required this.icon,
      required this.event,
      this.switchbtn = const SizedBox(),
      this.isSwitchBtn = false,
      required this.title});

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              width: kWidth(context) * 0.03,
            ),
            Expanded(
                child: Text(
              widget.title,
              style: const TextStyle(color: Colors.black, fontSize: 17),
            )),
            if (widget.isSwitchBtn) widget.switchbtn,
            if (!widget.isSwitchBtn)
              const Icon(
                Icons.arrow_right,
                size: 30,
              )
          ],
        ),
      ),
    );
  }
}
