import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/views/discoveryView.dart';
import 'package:success/views/homeView.dart';
import 'package:success/views/profilView.dart';
import 'package:success/views/settingsView.dart';

class Mainview extends StatefulWidget {
  final User user;
  const Mainview({super.key, required this.user});

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  int selectedPos = 1;

  late CircularBottomNavigationController _navigationController;
  List<TabItem> tabItems = List.of([
    TabItem(Icons.settings, "Paramètres", kprimaryColor,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: kquaternaryColor)),
    TabItem(Icons.home, "Accueil", kprimaryColor,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: kquaternaryColor)),
    TabItem(Icons.person, "Profil", kprimaryColor,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: kquaternaryColor)),
    TabItem(Icons.more_horiz, "Découverte", kprimaryColor,
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: kquaternaryColor)),
  ]);
  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Widget page;
    switch (selectedPos) {
      case 0:
        page = const SettingsView();
        break;
      case 1:
        page = Homeview(
          user: widget.user,
        );
        break;
      case 2:
        page = ProfilView(
          user: widget.user,
        );
        break;

      case 3:
        page = const DiscoveryView();
        break;

      default:
        page = Container();
        break;
    }

    return GestureDetector(
      child: page,
      onTap: () {},
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: 60,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
