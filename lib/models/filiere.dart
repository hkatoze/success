class Filiere {
  final int id;
  final String nom;
  final String description;
  final List<String> perspectives;
  final String departement;

  const Filiere({
    required this.id,
    required this.nom,
    required this.description,
    required this.perspectives,
    required this.departement,
  });

  factory Filiere.fromMap(Map<String, dynamic> map) {
    return Filiere(
      id: map['id'],
      nom: map['nom'],
      description: map['description'],
      perspectives: map['perspectives'] != null
          ? (map['perspectives'] as String).split(',')
          : [],
      departement: map['departement'],
    );
  }
}
