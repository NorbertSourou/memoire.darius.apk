class Sensors {
  Sensors({
    this.temperatureAmbiante,
    this.rythmeCardiaque,
    this.humidite,
    this.temperatureCorporelle,
    this.mouvement,
  });

  var temperatureAmbiante;
  var rythmeCardiaque;
  var humidite;
  var temperatureCorporelle;
  var mouvement;

  factory Sensors.fromJson(Map<String, dynamic> json) => Sensors(
        temperatureAmbiante: json["temperatureAmbiante"],
        rythmeCardiaque: json["rythmeCardiaque"],
        humidite: json["humidite"],
        temperatureCorporelle: json["temperatureCorporelle"],
        mouvement: json["mouvement"],
      );

  Map<String, dynamic> toJson() => {
        "temperatureAmbiante": temperatureAmbiante,
        "rythmeCardiaque": rythmeCardiaque,
        "humidite": humidite,
        "temperatureCorporelle": temperatureCorporelle,
        "mouvement": mouvement,
      };
}
