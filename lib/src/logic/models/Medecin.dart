class IdMedecin {
  IdMedecin({
    this.id,
    this.nom,
    this.prenoms,
    this.email,
    this.password,
    this.username,
  });

  int id;
  String nom;
  String prenoms;
  String email;
  String password;
  String username;

  factory IdMedecin.fromJson(Map<String, dynamic> json) => IdMedecin(
    id: json["id"],
    nom: json["nom"],
    prenoms: json["prenoms"],
    email: json["email"],
    password: json["password"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "prenoms": prenoms,
    "email": email,
    "password": password,
    "username": username,
  };
}
