class Exercice{
  String? _nom;
  String ? _muscle;

  Exercice(nom,muscle);

  String? get getMuscle => _muscle;
  String? get getNom => _nom;

  set setMuscle(String value) {
    _muscle = value;
  }

  set setNom(String value) {
    _nom = value;
  }
}