import "package:flutter/material.dart";
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

const List<Temperament> temperaments = [
  Temperament(
      id: 1,
      temperament: "populaire sanguin",
      description:
          "Tu es naturellement enthousiaste et extraverti, attirant les gens avec ton charme et ton énergie. Tu adores être au centre de l'attention, ce qui te rend souvent le cœur de la fête. Cependant, ta nature impulsive peut parfois te conduire à prendre des décisions hâtives sans penser aux conséquences. Tu peux également manquer de discipline, ce qui peut affecter ta capacité à rester concentré sur des tâches à long terme. Malgré ces défis, ta joie de vivre et ta capacité à inspirer les autres sont des atouts précieux."),
  Temperament(
      id: 2,
      temperament: "populaire colérique",
      description:
          "Tu combines le charisme et l’énergie d’un tempérament populaire avec la détermination et la force d’un tempérament colérique. Tu es capable de motiver et d’inspirer les autres avec facilité, et tu as une présence forte qui attire naturellement les gens. Cependant, ta tendance à être autoritaire et impatient peut parfois créer des conflits. Tu es souvent très direct dans tes communications, ce qui peut être perçu comme agressif. Néanmoins, ta capacité à diriger et à prendre des décisions rapidement est un grand avantage dans des situations de leadership."),
  Temperament(
      id: 3,
      temperament: "populaire mélancolique",
      description:
          "Tu es à la fois charmant et sensible, combinant la sociabilité d’un tempérament populaire avec la profondeur et la réflexion d’un tempérament mélancolique. Tu as une grande capacité à comprendre et à empathiser avec les autres, ce qui fait de toi un excellent confident. Cependant, ton perfectionnisme et ta sensibilité peuvent te rendre susceptible aux critiques et aux doutes personnels. Tu cherches souvent à atteindre des idéaux élevés, ce qui peut être à la fois une force et une source de stress. Ton sens artistique et ton souci du détail font de toi une personne créative et accomplie."),
  Temperament(
      id: 4,
      temperament: "populaire flegmatique",
      description:
          "Tu es amical et facile à vivre, avec une capacité naturelle à mettre les gens à l'aise. Ta nature sociable te permet de te faire des amis facilement, et tu apprécies les interactions sociales. Cependant, tu peux parfois manquer de motivation et de dynamisme, préférant éviter les confrontations et les conflits. Ta tendance à être détendu et à prendre les choses comme elles viennent peut être perçue comme de la paresse par certains. Malgré cela, ta capacité à rester calme et serein dans des situations stressantes est une qualité précieuse."),
  Temperament(
      id: 5,
      temperament: "puissant sanguin",
      description:
          "Tu es dynamique et déterminé, avec une énergie contagieuse qui inspire ceux qui t’entourent. Tu es excellent pour diriger et prendre des décisions rapides, ce qui fait de toi un leader naturel. Cependant, ta tendance à être enclin à la colère et impulsif peut parfois causer des tensions. Tu peux avoir du mal à rester patient et à contrôler tes émotions dans des situations frustrantes. Néanmoins, ta capacité à motiver et à diriger les autres est un atout majeur, et ton enthousiasme pour les nouveaux défis est admirable."),
  Temperament(
      id: 6,
      temperament: "puissant colérique",
      description:
          "Tu es un leader naturel, très compétitif et direct dans tes actions et tes décisions. Ta détermination et ta volonté de réussir sont des traits qui te distinguent. Cependant, tu peux être intolérant et autoritaire, ce qui peut parfois créer des conflits avec ceux qui ne partagent pas ta vision. Ta tendance à être trop exigeant peut aussi mettre la pression sur les autres. Malgré cela, ta capacité à prendre des décisions difficiles et à rester ferme dans tes convictions est une qualité essentielle pour le leadership."),
  Temperament(
      id: 7,
      temperament: "puissant mélancolique",
      description:
          "Tu es ambitieux et analytique, avec une forte attention aux détails. Tu combines la force de volonté d’un tempérament puissant avec la profondeur et la réflexion d’un tempérament mélancolique. Cependant, ton perfectionnisme et ta tendance à la critique peuvent parfois te rendre difficile à satisfaire. Tu as une grande capacité à planifier et à organiser, mais tu peux être dur avec toi-même et avec les autres lorsque les choses ne vont pas comme prévu. Ta capacité à maintenir des standards élevés et à rester concentré sur tes objectifs est impressionnante."),
  Temperament(
      id: 8,
      temperament: "puissant flegmatique",
      description:
          "Tu es efficace et résilient, capable de rester calme sous pression. Ta combinaison de détermination et de tranquillité te permet de gérer les situations stressantes avec facilité. Cependant, tu peux parfois sembler indifférent ou trop détaché, ce qui peut être perçu comme un manque de passion ou d'engagement. Ta capacité à prendre des décisions rationnelles et à rester stable même dans les moments difficiles est un grand avantage. Tu es souvent perçu comme un pilier de stabilité pour ceux qui t’entourent."),
  Temperament(
      id: 9,
      temperament: "parfait sanguin",
      description:
          "Tu es méticuleux et enthousiaste, avec une passion pour la perfection qui inspire les autres. Tu combines une attention aux détails avec une énergie vivante, ce qui te rend très efficace dans tout ce que tu entreprends. Cependant, tu peux être désorganisé et imprévisible, ce qui peut parfois contrecarrer tes efforts de perfection. Ta capacité à motiver les autres avec ta passion et ton enthousiasme est remarquable, mais veille à ne pas te laisser submerger par ton désir de tout faire parfaitement."),
  Temperament(
      id: 10,
      temperament: "parfait colérique",
      description:
          "Tu es détaillé et déterminé, avec une forte volonté de réussir. Ta combinaison de perfectionnisme et de détermination fait de toi une personne très accomplie. Cependant, tu peux être trop critique et autoritaire, ce qui peut créer des tensions dans tes relations. Ta tendance à chercher la perfection peut également te rendre impatient avec les imperfections des autres. Malgré ces défis, ta capacité à maintenir des standards élevés et à diriger avec confiance est un atout majeur."),
  Temperament(
      id: 11,
      temperament: "parfait mélancolique",
      description:
          "Tu es très analytique et sensible, avec une profondeur dans tes réflexions et émotions. Ton perfectionnisme et ta sensibilité te permettent de comprendre les choses en profondeur, mais tu peux aussi être pessimiste et trop autocritique. Ta tendance à la réflexion et à l'analyse te rend très conscient des détails et des subtilités, mais veille à ne pas te laisser submerger par la négativité. Ta capacité à voir au-delà des apparences et à chercher des solutions précises est une qualité précieuse."),
  Temperament(
      id: 12,
      temperament: "parfait flegmatique",
      description:
          "Tu es organisé et stable, capable de rester calme et posé même dans les moments de stress. Ta combinaison de perfectionnisme et de tranquillité te permet de gérer les détails avec soin et précision. Cependant, tu peux être hésitant et manquer d'enthousiasme, ce qui peut ralentir ton progrès. Ta capacité à maintenir une perspective équilibrée et à travailler méthodiquement est un grand avantage, mais veille à ne pas te laisser freiner par l'indécision."),
  Temperament(
      id: 13,
      temperament: "pacifique sanguin",
      description:
          "Tu es agréable et facile à vivre, avec une nature sociable qui te permet de te faire des amis facilement. Ta combinaison de tranquillité et d'enthousiasme te rend très accessible. Cependant, tu peux être oisif et manquer de discipline, ce qui peut affecter ta productivité. Ta capacité à maintenir l'harmonie et à éviter les conflits est un atout, mais veille à ne pas te laisser submerger par la paresse. Ton charme naturel et ton attitude détendue font de toi une personne très appréciée."),
  Temperament(
      id: 14,
      temperament: "pacifique colérique",
      description:
          "Tu es calme et équilibré, mais capable de prendre des décisions fermes quand nécessaire. Ta combinaison de tranquillité et de détermination te permet de gérer les situations avec sang-froid. Cependant, tu peux être trop permissif et manquer de direction, ce qui peut créer des problèmes dans les moments où une approche plus stricte est nécessaire. Ta capacité à rester serein et à prendre des décisions rationnelles est un grand avantage, mais veille à ne pas être trop passif."),
  Temperament(
      id: 15,
      temperament: "pacifique mélancolique",
      description:
          "Tu es diplomate et réfléchi, aimant la paix et la tranquillité. Ta combinaison de sensibilité et de tranquillité te rend très empathique et compréhensif. Cependant, tu peux être trop sensible et hésitant, ce qui peut t'empêcher de prendre des décisions difficiles. Ta capacité à maintenir une atmosphère harmonieuse et à comprendre les émotions des autres est une qualité précieuse, mais veille à ne pas te laisser submerger par la négativité. Ton approche équilibrée et posée fait de toi un pilier de stabilité pour ceux qui t’entourent."),
  Temperament(
      id: 16,
      temperament: "pacifique flegmatique",
      description:
          "Tu es stable et serein, rarement perturbé par les événements extérieurs. Ta combinaison de tranquillité et de résilience te permet de rester calme dans des situations stressantes. Cependant, tu peux être paresseux et indifférent aux changements, préférant maintenir le statu quo. Ta capacité à rester détendu et à prendre les choses comme elles viennent est un atout, mais veille à ne pas te laisser freiner par l'inaction. Ton approche équilibrée et posée fait de toi un pilier de stabilité pour ceux qui t'entourent.")
];

final List<Filiere> filieres = [
  // Sciences de Technologies
  const Filiere(
    id: 1,
    filiere: "Genie Civil",
    description:
        "Le génie civil concerne la conception, la construction et la maintenance des infrastructures comme les routes, les ponts, les bâtiments, les tunnels et les systèmes de traitement des eaux. Les ingénieurs civils travaillent sur des projets qui améliorent la qualité de vie et l'environnement.",
    debouches: [
      "Ingénieur civil",
      "Chef de chantier",
      "Consultant en génie civil",
      "Responsable de la planification urbaine",
      "Directeur des travaux publics",
      "Ingénieur en structures",
      "Inspecteur de bâtiment",
      "Ingénieur en hydraulique",
      "Gestionnaire de projet"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 2,
    filiere: "Maintenance industrielle",
    description:
        "La maintenance industrielle vise à assurer le bon fonctionnement et la longévité des équipements et des machines dans les usines et les sites de production. Elle comprend la maintenance préventive, corrective et prédictive, ainsi que la gestion de la sécurité.",
    debouches: [
      "Technicien de maintenance",
      "Responsable de maintenance",
      "Ingénieur de maintenance",
      "Superviseur de la maintenance",
      "Spécialiste en fiabilité",
      "Consultant en maintenance industrielle",
      "Coordinateur de maintenance",
      "Analyste de maintenance",
      "Gestionnaire d'actifs"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 3,
    filiere: "Genie Minier",
    description:
        "Le génie minier implique l'exploration, l'extraction et la gestion des ressources minérales de la Terre. Les ingénieurs miniers travaillent sur l'optimisation des méthodes d'extraction, la sécurité des mines, et la réduction de l'impact environnemental.",
    debouches: [
      "Ingénieur minier",
      "Géologue",
      "Responsable de site minier",
      "Consultant en exploration minière",
      "Ingénieur en sécurité minière",
      "Gestionnaire des ressources minérales",
      "Analyste des ressources naturelles",
      "Directeur d'exploitation minière",
      "Chercheur en ingénierie minière"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 4,
    filiere: "Genie Biomédical",
    description:
        "Le génie biomédical combine les principes de l'ingénierie et des sciences biologiques pour développer des technologies et des dispositifs médicaux. Les ingénieurs biomédicaux travaillent sur des équipements de diagnostic, des prothèses, des implants et des systèmes de soins de santé.",
    debouches: [
      "Ingénieur biomédical",
      "Technicien biomédical",
      "Consultant en équipements médicaux",
      "Chef de projet en dispositifs médicaux",
      "Responsable de la maintenance des équipements hospitaliers",
      "Chercheur en biomatériaux",
      "Spécialiste en imagerie médicale",
      "Concepteur de prothèses",
      "Ingénieur en biotechnologie"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 5,
    filiere: "Agroalimentaire",
    description:
        "L'agroalimentaire englobe la transformation des produits agricoles en produits alimentaires. Ce domaine couvre la production, la transformation, l'emballage, la distribution et le contrôle de la qualité des aliments.",
    debouches: [
      "Ingénieur agroalimentaire",
      "Responsable qualité",
      "Chef de production",
      "Consultant en sécurité alimentaire",
      "Directeur d'usine agroalimentaire",
      "Spécialiste en développement de produits",
      "Technologue alimentaire",
      "Gestionnaire de la chaîne d'approvisionnement",
      "Analyste en nutrition"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 6,
    filiere: "Energies Renouvelables",
    description:
        "Les énergies renouvelables se concentrent sur le développement et la gestion des sources d'énergie alternatives, comme le solaire, l'éolien, la biomasse et l'hydroélectricité. Ce domaine vise à réduire la dépendance aux combustibles fossiles et à promouvoir un avenir énergétique durable.",
    debouches: [
      "Ingénieur en énergies renouvelables",
      "Consultant en énergie",
      "Gestionnaire de projet énergétique",
      "Spécialiste en efficacité énergétique",
      "Chercheur en technologies renouvelables",
      "Responsable de la production d'énergie renouvelable",
      "Analyste en politiques énergétiques",
      "Concepteur de systèmes énergétiques",
      "Technicien en maintenance des énergies renouvelables"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 7,
    filiere: "Electronique et Informatique Industrielle",
    description:
        "Ce domaine implique la conception, le développement et la maintenance des systèmes électroniques et informatiques utilisés dans les processus industriels. Cela comprend l'automatisation, la robotique et les systèmes embarqués.",
    debouches: [
      "Ingénieur en électronique",
      "Technicien en informatique industrielle",
      "Consultant en systèmes industriels",
      "Développeur de systèmes embarqués",
      "Responsable de l'automatisation",
      "Spécialiste en robotique industrielle",
      "Concepteur de circuits électroniques",
      "Gestionnaire de projets industriels",
      "Analyste en systèmes industriels"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 8,
    filiere: "Reseaux informatiques et Telecoms",
    description:
        "Ce domaine couvre la gestion, la maintenance et la sécurité des réseaux informatiques et des systèmes de télécommunications. Les professionnels assurent le bon fonctionnement des infrastructures de communication.",
    debouches: [
      "Ingénieur réseaux",
      "Technicien télécoms",
      "Consultant en télécommunications",
      "Architecte de réseaux",
      "Administrateur réseau",
      "Spécialiste en cybersécurité",
      "Analyste de systèmes",
      "Gestionnaire de la sécurité des systèmes d'information",
      "Concepteur de réseaux"
    ],
    departement: "ST",
  ),
  const Filiere(
    id: 9,
    filiere: "Electrotechnique",
    description:
        "L'électrotechnique se concentre sur l'étude et l'application de l'électricité et de l'électromécanique. Les ingénieurs travaillent sur des systèmes électriques, des moteurs, des générateurs, et des équipements de transmission et de distribution d'électricité.",
    debouches: [
      "Ingénieur électrotechnique",
      "Technicien électrotechnique",
      "Responsable de maintenance électrique",
      "Consultant en électricité",
      "Chef de projet en systèmes électriques",
      "Spécialiste en conversion d'énergie",
      "Concepteur de systèmes électriques",
      "Gestionnaire de réseaux électriques",
      "Analyste en systèmes énergétiques"
    ],
    departement: "ST",
  ),
  // Sciences de Gestion
  const Filiere(
    id: 10,
    filiere: "Logistique-Transport-Transit",
    description:
        "La logistique et le transport impliquent la gestion des flux de marchandises, la planification des itinéraires, la gestion des stocks et la coordination des opérations de transit. Les professionnels optimisent les chaînes d'approvisionnement pour réduire les coûts et améliorer l'efficacité.",
    debouches: [
      "Logisticien",
      "Responsable transport",
      "Consultant en logistique",
      "Gestionnaire de la chaîne d'approvisionnement",
      "Coordinateur de transit",
      "Directeur des opérations logistiques",
      "Analyste logistique",
      "Planificateur de transport",
      "Spécialiste en gestion des stocks"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 11,
    filiere: "Finance-Comptabilité",
    description:
        "La finance et la comptabilité concernent la gestion financière des entreprises, l'analyse des états financiers, la planification budgétaire, et la prise de décisions économiques. Les professionnels veillent à la santé financière et à la conformité réglementaire.",
    debouches: [
      "Comptable",
      "Contrôleur de gestion",
      "Analyste financier",
      "Directeur financier",
      "Auditeur interne",
      "Consultant en gestion financière",
      "Gestionnaire de trésorerie",
      "Analyste en planification financière",
      "Responsable de la conformité"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 12,
    filiere: "Communication d'entreprise",
    description:
        "La communication d'entreprise englobe la gestion de la communication interne et externe, la gestion de la marque, les relations publiques, et la stratégie de communication. Les professionnels assurent une communication cohérente et efficace avec toutes les parties prenantes.",
    debouches: [
      "Responsable communication",
      "Chargé de communication",
      "Consultant en communication",
      "Spécialiste en relations publiques",
      "Directeur de la communication",
      "Community manager",
      "Gestionnaire de la marque",
      "Analyste en communication interne",
      "Planificateur d'événements"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 13,
    filiere: "Comptabilité-Controle-audit",
    description:
        "Cette filière se concentre sur la comptabilité avancée, le contrôle de gestion et l'audit. Les professionnels veillent à la précision des enregistrements financiers, à l'optimisation des processus de gestion, et à la conformité aux normes et réglementations.",
    debouches: [
      "Auditeur",
      "Contrôleur de gestion",
      "Comptable senior",
      "Consultant en audit",
      "Responsable de la conformité",
      "Directeur financier",
      "Analyste de risques financiers",
      "Gestionnaire de la performance",
      "Inspecteur des finances"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 14,
    filiere: "Secretariat de Direction Bureautique",
    description:
        "Le secrétariat de direction et la bureautique incluent la gestion administrative, la coordination des activités de bureau, la gestion des agendas et la communication avec les différents services. Les professionnels assurent le bon fonctionnement des opérations administratives.",
    debouches: [
      "Secrétaire de direction",
      "Assistant de direction",
      "Responsable administratif",
      "Gestionnaire de bureau",
      "Assistant personnel",
      "Coordonnateur des services administratifs",
      "Spécialiste en gestion documentaire",
      "Assistant exécutif",
      "Réceptionniste"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 15,
    filiere: "Banque et Microfinance",
    description:
        "Ce domaine couvre la gestion des services bancaires, la finance de marché, et la microfinance. Les professionnels travaillent sur l'octroi de prêts, la gestion des portefeuilles d'investissement, et le soutien financier aux petites entreprises.",
    debouches: [
      "Banquier",
      "Conseiller en microfinance",
      "Gestionnaire de portefeuille",
      "Analyste de crédit",
      "Consultant en services bancaires",
      "Responsable de la gestion des risques",
      "Directeur d'agence bancaire",
      "Spécialiste en finance inclusive",
      "Analyste des investissements"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 16,
    filiere: "Gestion des ressources humaines",
    description:
        "La gestion des ressources humaines inclut le recrutement, la formation, la gestion des performances, et le développement des talents. Les professionnels veillent à ce que l'organisation dispose des compétences nécessaires et favorisent un environnement de travail positif.",
    debouches: [
      "Responsable RH",
      "Chargé de recrutement",
      "Consultant RH",
      "Gestionnaire de formation",
      "Spécialiste en relations de travail",
      "Directeur des ressources humaines",
      "Gestionnaire de la paie",
      "Spécialiste en développement organisationnel",
      "Analyste des ressources humaines"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 17,
    filiere: "Gestions des projets",
    description:
        "La gestion de projets comprend la planification, l'exécution, le suivi et la clôture des projets. Les professionnels utilisent des méthodologies de gestion de projet pour s'assurer que les projets sont livrés à temps, dans les limites du budget et selon les spécifications.",
    debouches: [
      "Chef de projet",
      "Consultant en gestion de projet",
      "Planificateur de projet",
      "Coordinateur de projet",
      "Directeur de programme",
      "Spécialiste en gestion agile",
      "Analyste de projet",
      "Gestionnaire de la qualité",
      "Responsable de la PMO"
    ],
    departement: "SG",
  ),
  const Filiere(
    id: 18,
    filiere: "Marketing et gestion commerciale",
    description:
        "Ce domaine implique la gestion des activités marketing et commerciales, y compris la recherche de marché, la stratégie marketing, la gestion des ventes, et la relation client. Les professionnels travaillent à augmenter les ventes et à développer des relations durables avec les clients.",
    debouches: [
      "Responsable marketing",
      "Chef de produit",
      "Consultant en marketing",
      "Directeur des ventes",
      "Analyste de marché",
      "Spécialiste en gestion de la relation client",
      "Gestionnaire de marque",
      "Directeur commercial",
      "Responsable des opérations de vente"
    ],
    departement: "SG",
  ),
];
List<Filiere> recommanderFilieres(String temperament) {
  switch (temperament) {
    case "populaire sanguin":
      return filieres
          .where((filiere) => [
                "Marketing et gestion commerciale",
                "Communication d'entreprise",
                "Logistique-Transport-Transit"
              ].contains(filiere.filiere))
          .toList();
    case "populaire colérique":
      return filieres
          .where((filiere) => [
                "Marketing et gestion commerciale",
                "Gestion des ressources humaines",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "populaire mélancolique":
      return filieres
          .where((filiere) => [
                "Communication d'entreprise",
                "Finance-Comptabilité",
                "Electronique et Informatique Industrielle"
              ].contains(filiere.filiere))
          .toList();
    case "populaire flegmatique":
      return filieres
          .where((filiere) => [
                "Logistique-Transport-Transit",
                "Communication d'entreprise",
                "Banque et Microfinance"
              ].contains(filiere.filiere))
          .toList();
    case "puissant sanguin":
      return filieres
          .where((filiere) => [
                "Genie Civil",
                "Gestion des ressources humaines",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "puissant colérique":
      return filieres
          .where((filiere) => [
                "Genie Civil",
                "Gestion des ressources humaines",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "puissant mélancolique":
      return filieres
          .where((filiere) => [
                "Genie Civil",
                "Finance-Comptabilité",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "puissant flegmatique":
      return filieres
          .where((filiere) => [
                "Gestion des ressources humaines",
                "Logistique-Transport-Transit",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "parfait sanguin":
      return filieres
          .where((filiere) => [
                "Finance-Comptabilité",
                "Comptabilité-Controle-audit",
                "Electronique et Informatique Industrielle"
              ].contains(filiere.filiere))
          .toList();
    case "parfait colérique":
      return filieres
          .where((filiere) => [
                "Genie Civil",
                "Finance-Comptabilité",
                "Comptabilité-Controle-audit"
              ].contains(filiere.filiere))
          .toList();
    case "parfait mélancolique":
      return filieres
          .where((filiere) => [
                "Finance-Comptabilité",
                "Comptabilité-Controle-audit",
                "Electronique et Informatique Industrielle"
              ].contains(filiere.filiere))
          .toList();
    case "parfait flegmatique":
      return filieres
          .where((filiere) => [
                "Finance-Comptabilité",
                "Secretariat de Direction Bureautique",
                "Banque et Microfinance"
              ].contains(filiere.filiere))
          .toList();
    case "pacifique sanguin":
      return filieres
          .where((filiere) => [
                "Logistique-Transport-Transit",
                "Communication d'entreprise",
                "Banque et Microfinance"
              ].contains(filiere.filiere))
          .toList();
    case "pacifique colérique":
      return filieres
          .where((filiere) => [
                "Gestion des ressources humaines",
                "Logistique-Transport-Transit",
                "Gestions des projets"
              ].contains(filiere.filiere))
          .toList();
    case "pacifique mélancolique":
      return filieres
          .where((filiere) => [
                "Finance-Comptabilité",
                "Secretariat de Direction Bureautique",
                "Banque et Microfinance"
              ].contains(filiere.filiere))
          .toList();
    case "pacifique flegmatique":
      return filieres
          .where((filiere) => [
                "Logistique-Transport-Transit",
                "Secretariat de Direction Bureautique",
                "Banque et Microfinance"
              ].contains(filiere.filiere))
          .toList();
    default:
      return [];
  }
}
