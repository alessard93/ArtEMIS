import 'package:artemis/models/geometry.dart';

class Oeuvre{
  late int id;
  late String artiste;
  late String organisme;
  late String adresse;
  late String annee;
  late String arrondissement;
  late String programme_entente;
  late double latitude;
  late double longitude;
  late String image;
  late Geometry geometry;

  Oeuvre({
    required this.id,
    required this.artiste,
    required this.organisme,
    required this.adresse,
    required this.annee,
    required this.arrondissement,
    required this.programme_entente,
    required this.latitude,
    required this.longitude,
    required this.image,
    required this.geometry
  });

  factory Oeuvre.fromJson(Map<String, dynamic> json) => Oeuvre(
    id: json["id"],
    artiste: json["artiste"],
    organisme: json["organisme"],
    adresse: json["adresse"],
    annee: json["annee"],
    arrondissement: json["arrondissement"],
    programme_entente: json["programme_entente"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    image: json["image"],
    geometry: Geometry.fromJson(json["geometry"])

  );
}