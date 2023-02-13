class Exercice{
  String? _nom;
  String ? _muscle;
  String? _type;

  Exercice(this._nom,this._muscle,this._type);

  String? get getMuscle => _muscle;
  String? get getNom => _nom;
  String? get getType => _type;

  set setMuscle(String value) {
    _muscle = value;
  }

  set setNom(String value) {
    _nom = value;
  }
  set setType(String value)=>_type = value;
}