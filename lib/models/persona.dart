class Persona {
  String nom;
  String correu;
  String dataNaixement;

  Persona({
    this.nom = 'Pau Ferrer',
    this.correu = 'pauferrer1@paucasesnovescifp.cat',
    this.dataNaixement = '15/08/2007',
  });

  String get fullName => nom;
  set fullName(String valor) => nom = valor;

  String get email => correu;
  set email(String valor) => correu = valor;

  String get dateOfBirth => dataNaixement;
  set dateOfBirth(String valor) => dataNaixement = valor;

  Persona copyWith({String? nom, String? correu, String? dataNaixement}) {
    return Persona(
      nom: nom ?? this.nom,
      correu: correu ?? this.correu,
      dataNaixement: dataNaixement ?? this.dataNaixement,
    );
  }
}
