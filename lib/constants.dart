import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:success/models/filiere.dart";
import "package:success/models/personalityTestResult.dart";
import "package:success/models/qualifier.dart";

const kprimaryColor = Color(0xFFbcc3d2);
const ksecondaryColor = Color(0xFFcbc593);
const ktertiaryColor = Color(0xFF2563eb);
const kquaternaryColor = Color(0xFF002f59);
const kquinquinaryColor = Color(0xFFe03d06);

double kWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const List<Qualifier> allQualifiers = [
  Qualifier(
      id: 1, label: "aventureux", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 2, label: "adaptable", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 3, label: "animé", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 4, label: "analytique", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 5, label: "agité", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 6, label: "audacieux", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 7, label: "sage", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 8, label: "équilibré", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 9, label: "attentionné", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 10, label: "contrôlé", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 11, label: "compétitif", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 12, label: "convaincant", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 13, label: "jovial", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 14, label: "cohérent", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 15, label: "cultivé", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 16, label: "confiant", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 17, label: "satisfait", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 18, label: "chef", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 19, label: "graphiste", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 20, label: "rusé", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 21, label: "entreprenant", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 22, label: "joyeux", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 23, label: "diplomatique", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 24, label: "minutieux", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 25, label: "démonstratif", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 26, label: "décisif", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 27,
      label: "humour caustique",
      group: "FORCE",
      temperament: "pacifique"),
  Qualifier(id: 28, label: "profond", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 29, label: "amical", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 30, label: "fidèle", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 31, label: "amusant", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 32, label: "énergique", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 33, label: "idéaliste", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 34, label: "indépendant", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 35, label: "inoffensif", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 36, label: "stimulant", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 37, label: "auditeur", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 38, label: "loyal", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 39, label: "leader", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 40, label: "plein de vie", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 41, label: "médiateur", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 42, label: "musical", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 43, label: "mobile", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 44, label: "convivial", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 45, label: "ordonné", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 46, label: "serviable", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 47, label: "direct", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 48, label: "optimiste", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 49, label: "perfectionniste", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 50, label: "agréable", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 51, label: "productif", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 52, label: "populaire", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 53, label: "persistant", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 54, label: "enjoué", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 55, label: "persuasif", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 56, label: "pacifique", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 57, label: "planificateur", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 58, label: "patient", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 59, label: "positif", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 60, label: "promoteur", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 61,
      label: "rafraichissant",
      group: "FORCE",
      temperament: "populaire"),
  Qualifier(
      id: 62, label: "respectueux", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 63, label: "réservé", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 64, label: "talentueux", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 65, label: "comblé", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 66, label: "sensible", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 67, label: "autonome", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 68, label: "futé", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 69, label: "soumis", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 70, label: "dévoué", group: "FORCE", temperament: "parfait"),
  Qualifier(
      id: 71, label: "sociable", group: "FORCE", temperament: "populaire"),
  Qualifier(id: 72, label: "entêté", group: "FORCE", temperament: "puissant"),
  Qualifier(id: 73, label: "sûr", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 74, label: "spontané", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 75, label: "discipliné", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 76, label: "timide", group: "FORCE", temperament: "pacifique"),
  Qualifier(id: 77, label: "réfléchi", group: "FORCE", temperament: "parfait"),
  Qualifier(id: 78, label: "tenace", group: "FORCE", temperament: "puissant"),
  Qualifier(
      id: 79, label: "expressif", group: "FORCE", temperament: "populaire"),
  Qualifier(
      id: 80, label: "tolérant", group: "FORCE", temperament: "pacifique"),
  Qualifier(
      id: 81,
      label: "enclin à la colère",
      group: "FAIBLESSE",
      temperament: "sanguin"),
  Qualifier(
      id: 82, label: "oisif", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 83, label: "polémiste", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 84, label: "aliéné", group: "FAIBLESSE", temperament: "mélancolique"),
  Qualifier(
      id: 85,
      label: "ignorant",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 86, label: "effacé", group: "FAIBLESSE", temperament: "mélancolique"),
  Qualifier(
      id: 87, label: "strident", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 88,
      label: "autoritaire",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 89,
      label: "corrompu",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 90,
      label: "critique",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 91, label: "malin", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 92, label: "versatile", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 93, label: "douteux", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 94, label: "désorganisé", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 95,
      label: "dominateur",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 96,
      label: "déprimé",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 97,
      label: "difficile",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 98,
      label: "craintif",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 99, label: "oublieux", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 100, label: "franc", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 101, label: "obstiné", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 102, label: "hasardeux", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 103,
      label: "trop exigeant",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 104,
      label: "hésitant",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 105,
      label: "impatient",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 106,
      label: "manque d'assurance",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 107,
      label: "indécis",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 108,
      label: "perturbateur",
      group: "FAIBLESSE",
      temperament: "sanguin"),
  Qualifier(
      id: 109, label: "incohérant", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 110,
      label: "introverti",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 111,
      label: "intolérant",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 112,
      label: "indifférent",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 113,
      label: "solitaire",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 114,
      label: "dictateur",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 115,
      label: "paresseux",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 116, label: "bruyant", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 117, label: "désordonné", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 118,
      label: "boudeur",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 119,
      label: "marmonne",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 120,
      label: "manipulateur",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(id: 121, label: "naïf", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 122,
      label: "négatif",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 123, label: "effronté", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 124,
      label: "nonchalant",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 125, label: "direct", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 126,
      label: "pessimiste",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 127,
      label: "orgueilleux",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 128, label: "permissif", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 129,
      label: "réticent",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 130,
      label: "rancunier",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 131,
      label: "résistant",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 132, label: "répétitif", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 133,
      label: "vindicatif",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 134, label: "agité", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 135,
      label: "réticent",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 136,
      label: "impétueux",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 137, label: "lent", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 138, label: "têtu", group: "FAIBLESSE", temperament: "colérique"),
  Qualifier(
      id: 139,
      label: "prétentieux",
      group: "FAIBLESSE",
      temperament: "sanguin"),
  Qualifier(
      id: 140,
      label: "sceptique",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 141, label: "lent", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 142,
      label: "méfiant",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 143,
      label: "s'emporte facilement",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 144, label: "écervelé", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 145,
      label: "trop sensible",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 146,
      label: "manque de tact",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 147, label: "timide", group: "FAIBLESSE", temperament: "flegmatique"),
  Qualifier(
      id: 148, label: "bavard", group: "FAIBLESSE", temperament: "sanguin"),
  Qualifier(
      id: 149,
      label: "indiscipliné",
      group: "FAIBLESSE",
      temperament: "sanguin"),
  Qualifier(
      id: 150,
      label: "indifférent",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 151,
      label: "peu enthousiaste",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 152,
      label: "impitoyable",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 153,
      label: "impopulaire",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 154,
      label: "désengagé",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 155,
      label: "imprévisible",
      group: "FAIBLESSE",
      temperament: "sanguin"),
  Qualifier(
      id: 156,
      label: "peu affectif",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 157,
      label: "inquiet",
      group: "FAIBLESSE",
      temperament: "flegmatique"),
  Qualifier(
      id: 158,
      label: "retiré",
      group: "FAIBLESSE",
      temperament: "mélancolique"),
  Qualifier(
      id: 159,
      label: "bourreau de travail",
      group: "FAIBLESSE",
      temperament: "colérique"),
  Qualifier(
      id: 160,
      label: "avare de reconnaissance/eloges",
      group: "FAIBLESSE",
      temperament: "sanguin"),
];

List<Qualifier> forceQualifiers =
    allQualifiers.where((q) => q.group == "FORCE").toList();
List<Qualifier> faiblesseQualifiers =
    allQualifiers.where((q) => q.group == "FAIBLESSE").toList();

List<Filiere> recommanderFilieres(List<Filiere> allFilieres,
    List<Temperament> allTemperaments, String temperament) {
  // Fonction pour récupérer les filières recommandées selon le tempérament
  List<String> getFilieresRecommandees() {
    final filteredTemperaments = allTemperaments
        .where((temp) =>
            "${temp.temperamentForce} ${temp.temperamentFaiblesse}" ==
            temperament)
        .toList();

    return filteredTemperaments.isNotEmpty
        ? filteredTemperaments[0].filiereRecommandee.toList()
        : [];
  }

  final filieresRecommandees = getFilieresRecommandees();

  return allFilieres
      .where((filiere) => filieresRecommandees.contains(filiere.nom))
      .toList();
}

enum ToastType {
  NORMAL,
  ERROR,
  SUCCESS,
}

void showToast(String message, ToastType type) {
  Color backgroundColor;
  switch (type) {
    case ToastType.NORMAL:
      backgroundColor = ktertiaryColor;
      break;
    case ToastType.ERROR:
      backgroundColor = Colors.red;
      break;
    case ToastType.SUCCESS:
      backgroundColor = Colors.green;
      break;
  }
  Fluttertoast.showToast(
      msg: message.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
