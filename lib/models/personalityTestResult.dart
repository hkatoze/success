import 'package:success/models/qualifier.dart';

class Temperament {
  final int id;
  final String temperamentFaiblesse;
  final String temperamentForce;
  final List<String> filiereRecommandee;

  final String description;

  const Temperament({
    required this.description,
    required this.id,
    required this.filiereRecommandee,
    required this.temperamentFaiblesse,
    required this.temperamentForce,
  });

  factory Temperament.fromMap(Map<String, dynamic> map) {
    return Temperament(
      id: map['id'],
      temperamentFaiblesse: map['temperamentFaiblesse'],
      filiereRecommandee: map['filiereRecommandee'] != null
          ? (map['filiereRecommandee'] as String).split(',')
          : [],
      temperamentForce: map['temperamentForce'],
      description: map['description'],
    );
  }
}

class PersonalityTestResult {
  final String dominantForceTemperament;
  final String dominantWeaknessTemperament;

  PersonalityTestResult(
      {required this.dominantForceTemperament,
      required this.dominantWeaknessTemperament});
}

List<Qualifier> getNextBatch(List<Qualifier> qualifiers, int currentIndex) {
  return qualifiers.skip(currentIndex).take(4).toList();
}

String calculateDominantTemperament(List<String> selectedTemperaments) {
  Map<String, int> temperamentCount = {};

  for (var temperament in selectedTemperaments) {
    if (temperamentCount.containsKey(temperament)) {
      temperamentCount[temperament] = temperamentCount[temperament]! + 1;
    } else {
      temperamentCount[temperament] = 1;
    }
  }

  return temperamentCount.entries
      .reduce((a, b) => a.value > b.value ? a : b)
      .key;
}
