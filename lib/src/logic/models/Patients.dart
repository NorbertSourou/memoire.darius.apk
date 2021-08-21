import 'Lit.dart';
import 'Medecin.dart';

class Patients {
  Patients({
    this.id,
    this.idMedecin,
    this.idLit,
    this.nom,
    this.prenoms,
  });

  int id;
  IdMedecin idMedecin;
  IdLit idLit;
  String nom;
  String prenoms;

  factory Patients.fromJson(Map<String, dynamic> json) => Patients(
        id: json["id"],
        idMedecin: IdMedecin.fromJson(json["idMedecin"]),
        idLit: IdLit.fromJson(json["idLit"]),
        nom: json["nom"],
        prenoms: json["prenoms"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idMedecin": idMedecin.toJson(),
        "idLit": idLit.toJson(),
        "nom": nom,
        "prenoms": prenoms,
      };
}