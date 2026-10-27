class Persona {
  String nom;
  String llinatges;
  String correu;
  String contrasenya;
  String dataNaixement;

  Persona({
    this.nom = 'Pau',
    this.llinatges = 'Ferrer Tous',
    this.correu = 'pauferrer1@paucasesnovescifp.cat',
    this.contrasenya = '1234',
    this.dataNaixement = '15/08/2007',
  });

  String get nomComplet => '$nom $llinatges';

  Persona copyWith({
    String? nom,
    String? llinatges,
    String? correu,
    String? contrasenya,
    String? dataNaixement,
  }) {
    return Persona(
      nom: nom ?? this.nom,
      llinatges: llinatges ?? this.llinatges,
      correu: correu ?? this.correu,
      contrasenya: contrasenya ?? this.contrasenya,
      dataNaixement: dataNaixement ?? this.dataNaixement,
    );
  }
}
