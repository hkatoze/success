import 'dart:convert';

class User {
  final int id;
  final String firstnameAndLastname;
  final String phone;
  final String gender;
  final String typeOfBac;
  final String bacYear;
  final String comeFromCountry;
  final String comeFromTown;
  final String dominantForceTemperament;
  final String dominantWeaknessTemperament;
  final String temperament;
  final String skills;

  User({
    required this.id,
    required this.firstnameAndLastname,
    required this.phone,
    required this.gender,
    required this.typeOfBac,
    required this.bacYear,
    required this.comeFromCountry,
    required this.comeFromTown,
    required this.dominantForceTemperament,
    required this.dominantWeaknessTemperament,
    required this.temperament,
    required this.skills,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstnameAndLastname: map['firstnameAndLastname'],
      phone: map['phone'],
      gender: map['gender'],
      typeOfBac: map['typeOfBac'],
      bacYear: map['bacYear'],
      comeFromCountry: map['comeFromCountry'],
      comeFromTown: map['comeFromTown'],
      dominantForceTemperament: map['dominantForceTemperament'],
      dominantWeaknessTemperament: map['dominantWeaknessTemperament'],
      temperament: map['temperament'],
      skills: map['skills'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstnameAndLastname': firstnameAndLastname,
      'phone': phone,
      'gender': gender,
      'typeOfBac': typeOfBac,
      'bacYear': bacYear,
      'comeFromCountry': comeFromCountry,
      'comeFromTown': comeFromTown,
      'dominantForceTemperament': dominantForceTemperament,
      'dominantWeaknessTemperament': dominantWeaknessTemperament,
      'temperament': temperament,
      'skills': skills,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
