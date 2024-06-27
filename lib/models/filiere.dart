class Filiere {
  final int id;
  final String filiere;
  final String description;
  final List<String> debouches;
  final String departement;

  const Filiere({
    required this.id,
    required this.filiere,
    required this.description,
    required this.debouches,
    required this.departement,
  });
}
