import 'package:success/constants.dart';
import 'package:success/models/qualifier.dart';

class Temperament {
  final int id;
  final String temperament;
  final String description;
  const Temperament(
      {required this.description, required this.id, required this.temperament});
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

String getDescriptionByTemperament(String temperament) {
  // Parcours de la liste des tempéraments
  for (var temp in temperaments) {
    // Vérification si le tempérament correspond
    if (temp.temperament == temperament.toLowerCase()) {
      // Retourne la description si le tempérament est trouvé
      return temp.description;
    }
  }
  // Retourne une chaîne vide si le tempérament n'est pas trouvé
  return '';
}
