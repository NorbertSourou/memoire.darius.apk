class Sensors {
  Sensors(
      {this.temperatureAmbiante,
      this.rythmeCardiaque,
      this.humidite,
      this.temperatureCorporelle,
      this.mouvement,
      this.idpatients});

  var temperatureAmbiante;
  var rythmeCardiaque;
  var humidite;
  var temperatureCorporelle;
  var idpatients;
  var mouvement;

  factory Sensors.fromJson(Map<String, dynamic> json) => Sensors(
      temperatureAmbiante: json["temperature_ambiante"],
      rythmeCardiaque: json["rythme_cardiaque"],
      humidite: json["humidite"],
      temperatureCorporelle: json["temperature_corporelle"],
      mouvement: json["mouvement"],
      idpatients: json["patients_id"]);

  Map<String, dynamic> toJson() =>
      {
        "temperatureAmbiante": temperatureAmbiante,
        "rythmeCardiaque": rythmeCardiaque,
        "humidite": humidite,
        "temperatureCorporelle": temperatureCorporelle,
        "mouvement": mouvement,
        "patients_id": idpatients,
      };
}
