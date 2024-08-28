import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:success/constants.dart';
import 'package:success/models/user.dart';
import 'package:success/services/local_db_services.dart';
import 'package:success/views/components/option.dart';

class Options extends StatefulWidget {
  final List<Option> options;
  final double height;
  final void Function() action;

  const Options(
      {super.key,
      required this.options,
      required this.action,
      required this.height});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int _selectedOption = 0;
  User? user;

  @override
  void initState() {
    super.initState();
    fetchUserInfos();
  }

  void fetchUserInfos() async {
    final User? loggedUser = await DatabaseManager.instance.getLoggedUser();

    setState(() {
      user = loggedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.options.length,
        itemBuilder: (BuildContext context, index) => Bounce(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                      width: 3,
                      color: widget.options[index].value == _selectedOption
                          ? kquaternaryColor
                          : ksecondaryColor)),
              child: Center(
                  child: RadioListTile(
                activeColor: kquinquinaryColor,
                title: Text(
                  widget.options[index].option,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                value: widget.options[index].value,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                  if (widget.options.first.option == "BAC A") {
                    DatabaseManager.instance.updateUser(User(
                      id: user!.id,
                      bacYear: user!.bacYear,
                      comeFromCountry: user!.comeFromCountry,
                      comeFromTown: user!.comeFromTown,
                      firstnameAndLastname: user!.firstnameAndLastname,
                      gender: user!.gender,
                      phone: user!.phone,
                      typeOfBac: widget.options[index].option,
                      dominantForceTemperament: "",
                      dominantWeaknessTemperament: "",
                      temperament: "",
                      skills: "",
                    ));
                    debugPrint(widget.options[index].option);
                  }

                  if (widget.options.first.option == "2024") {
                    DatabaseManager.instance.updateUser(User(
                      id: user!.id,
                      bacYear: widget.options[index].option,
                      comeFromCountry: user!.comeFromCountry,
                      comeFromTown: user!.comeFromTown,
                      firstnameAndLastname: user!.firstnameAndLastname,
                      gender: user!.gender,
                      phone: user!.phone,
                      typeOfBac: user!.typeOfBac,
                      dominantForceTemperament: "",
                      dominantWeaknessTemperament: "",
                      temperament: "",
                      skills: "",
                    ));
                    debugPrint(widget.options[index].option);
                  }

                  if (widget.options.first.option == "HOMME") {
                    DatabaseManager.instance.updateUser(User(
                      id: user!.id,
                      bacYear: user!.bacYear,
                      comeFromCountry: user!.comeFromCountry,
                      comeFromTown: user!.comeFromTown,
                      firstnameAndLastname: user!.firstnameAndLastname,
                      gender: widget.options[index].option,
                      phone: user!.phone,
                      typeOfBac: user!.typeOfBac,
                      dominantForceTemperament: "",
                      dominantWeaknessTemperament: "",
                      temperament: "",
                      skills: "",
                    ));
                    debugPrint(widget.options[index].option);
                  }
                  if (widget.options.first.option == "Bénin") {
                    DatabaseManager.instance.updateUser(User(
                      id: user!.id,
                      bacYear: user!.bacYear,
                      comeFromCountry: widget.options[index].option,
                      comeFromTown: user!.comeFromTown,
                      firstnameAndLastname: user!.firstnameAndLastname,
                      gender: user!.gender,
                      phone: user!.phone,
                      typeOfBac: user!.typeOfBac,
                      dominantForceTemperament: "",
                      dominantWeaknessTemperament: "",
                      temperament: "",
                      skills: "",
                    ));
                    debugPrint(widget.options[index].option);
                  }
                  if (widget.options.first.option == "Dédougou") {
                    DatabaseManager.instance.updateUser(User(
                      id: user!.id,
                      bacYear: user!.bacYear,
                      comeFromCountry: user!.comeFromCountry,
                      comeFromTown: widget.options[index].option,
                      firstnameAndLastname: user!.firstnameAndLastname,
                      gender: user!.gender,
                      phone: user!.phone,
                      typeOfBac: user!.typeOfBac,
                      dominantForceTemperament: "",
                      dominantWeaknessTemperament: "",
                      temperament: "",
                      skills: "",
                    ));
                    debugPrint(widget.options[index].option);
                  }

                  widget.action();
                },
              )),
            )),
      ),
    );
  }
}
