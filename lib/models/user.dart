import 'package:flutter/material.dart';

class User {
  final int id;
  final String? firstnameAndLastname;
  final String? phone;
  final String? gender;
  final String? typeOfBac;
  final String? bacYear;
  final String? comeFromCountry;
  final String? comeFromTown;
  final String dominantForceTemperament;
  final String dominantWeaknessTemperament;
  final String? temperament;
  final String? skills;

  const User(
      {Key? key,
      required this.id,
      this.bacYear,
      this.comeFromCountry,
      this.comeFromTown,
      this.firstnameAndLastname,
      this.gender,
      this.phone,
      this.typeOfBac,
      this.skills,
      this.temperament,
      required this.dominantForceTemperament,
      required this.dominantWeaknessTemperament});

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
        skills: map['skills']);
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
      'temperament': temperament,
      'dominantWeaknessTemperament': dominantWeaknessTemperament,
      'skills': skills
    };
  }
}
