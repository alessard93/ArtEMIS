import 'package:artemis/models/oeuvre.dart';
import 'package:artemis/widgets/card_oeuvre_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class OeuvreCard extends StatelessWidget {
  const OeuvreCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    var oeuvresJSON = '''{
    "type": "FeatureCollection",
    "crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
    "features": [
    { "type": "Feature", "properties": { "id": 1, "artiste": "Yannick Picard", "organisme": "MU", "adresse": "4105, 47e rue (coin Pie IX)", "annee": "2007", "arrondissement": "Villeray–Saint-Michel–Parc-Extension", "programme_entente": "Programme graffitis et murales", "latitude": 45.58041, "longitude": -73.622218, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/MU-CentreSaintReneGoupil.jpg" }, "geometry": { "type": "Point", "coordinates": [ -73.622218, 45.58041 ] } },
    { "type": "Feature", "properties": { "id": 2, "artiste": "Artducommun", "organisme": "Corporation de développement urbain Faubourg Saint-Laurent", "adresse": "coin des rues Saint-Laurent et Viger", "annee": "2007", "arrondissement": "Ville-Marie", "programme_entente": "Programme graffitis et murales", "latitude": 45.506855, "longitude": -73.558029, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/CDU-MissionOldBrewery–40eExpo67.jpg" }, "geometry": { "type": "Point", "coordinates": [ -73.558029, 45.506855 ] } },
    { "type": "Feature", "properties": { "id": 3, "artiste": "Carlito Dalceggio ", "organisme": "MU", "adresse": "3 601, rue De Bullion (coin Prince-Arthur)", "annee": "2008", "arrondissement": "Le Plateau-Mont-Royal", "programme_entente": "Programme graffitis et murales", "latitude": 45.515387, "longitude": -73.571347, "image": "https:\/\/depot.ville.montreal.qc.ca\/murales\/MU-PrinceArthur-DeBullion.jpg" }, "geometry": { "type": "Point", "coordinates": [ -73.571347, 45.515387 ] } }
    ]}
    ''';

    Map<String, dynamic> jsonInput = json.decode(oeuvresJSON);

    var list2 = jsonInput["features"] as List;

    List<Oeuvre> oeuvres = list2.map((i)=>Oeuvre.fromJson(i["properties"], i)).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14.0, right: 2),
            child: Row(
            children: [
              Card(
                elevation: 0,
                color: Colors.transparent,
                child: Text(
                  'Oeuvres d\u0027art / Emplacements',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardOeuvreWidget(oeuvre: oeuvres[0]),
                CardOeuvreWidget(oeuvre: oeuvres[1]),
                CardOeuvreWidget(oeuvre: oeuvres[2])
              ],
            ),
        ],
      )
    );
  }
}