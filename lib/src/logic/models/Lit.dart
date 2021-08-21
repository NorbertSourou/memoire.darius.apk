class IdLit {
  IdLit({
    this.id,
    this.numLit,
    this.statut,
  });

  int id;
  int numLit;
  bool statut;

  factory IdLit.fromJson(Map<String, dynamic> json) => IdLit(
        id: json["id"],
        numLit: json["numLit"],
        statut: json["statut"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numLit": numLit,
        "statut": statut,
      };
}
