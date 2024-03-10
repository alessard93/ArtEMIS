import 'package:artemis/models/oeuvre.dart';
import 'package:flutter/material.dart';

class CardOeuvreWidget extends StatelessWidget {
  final Oeuvre oeuvre;
  const CardOeuvreWidget({super.key, required this.oeuvre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
        height: 175,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(oeuvre.image),
            fit: BoxFit.fill
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        oeuvre.artiste,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        )
                      ),
                    )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            ),
                          Text(
                            oeuvre.arrondissement,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
          ),
        )
      ),
    );
  }
}