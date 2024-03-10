import 'package:artemis/models/oeuvre.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OeuvreCard extends StatelessWidget {
  const OeuvreCard({super.key});

  @override
  Widget build(BuildContext context) {
    var oeuvresJSON = '''[
      { "id": 1, "artiste": "Yannick Picard", "organisme": "MU", "adresse": "4105, 47e rue (coin Pie IX)", "annee": "2007", "arrondissement": "Villeray–Saint-Michel–Parc-Extension", "programme_entente": "Programme graffitis et murales", "latitude": 45.58041, "longitude": -73.622218, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/MU-CentreSaintReneGoupil.jpg", "geometry": { "type": "Point", "coordinates": [ -73.622218, 45.58041 ] }},
      { "id": 2, "artiste": "Artducommun", "organisme": "Corporation de développement urbain Faubourg Saint-Laurent", "adresse": "coin des rues Saint-Laurent et Viger", "annee": "2007", "arrondissement": "Ville-Marie", "programme_entente": "Programme graffitis et murales", "latitude": 45.506855, "longitude": -73.558029, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/CDU-MissionOldBrewery–40eExpo67.jpg", "geometry": { "type": "Point", "coordinates": [ -73.558029, 45.506855 ] }},
      { "id": 3, "artiste": "Carlito Dalceggio ", "organisme": "MU", "adresse": "3 601, rue De Bullion (coin Prince-Arthur)", "annee": "2008", "arrondissement": "Le Plateau-Mont-Royal", "programme_entente": "Programme graffitis et murales", "latitude": 45.515387, "longitude": -73.571347, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/MU-PrinceArthur-DeBullion.jpg", "geometry": { "type": "Point", "coordinates": [ -73.571347, 45.515387 ] }}
    ]''';

    var list = json.decode(oeuvresJSON) as List;

    List<Oeuvre> oeuvres = list.map((i)=>Oeuvre.fromJson(i)).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14.0, bottom: 2),
            child: Row(
            children: [
              Text(
                'Oeuvres d''art / Emplacements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
              SizedBox(width: 4),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Voir tout',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey
                  ),
                ),
              ),
            ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Container(
                  height: 175,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(oeuvres[0].image),
                      fit: BoxFit.fill
                    ),
                  ),
                  child: Center(
                    child: Card(
                        color: Colors.white,
                        child: Text(
                          oeuvres[0].artiste,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black
                          )
                        )
                      ),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}