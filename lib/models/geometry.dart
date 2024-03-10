class Geometry{
  late String type;
  late List<dynamic> coordinates;

  Geometry({
    required this.type,
    required this.coordinates
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"], 
    coordinates: json["coordinates"]
  );
}