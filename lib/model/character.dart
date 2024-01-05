class Character {
  int id;
  String name;
  String status;
  String species;
  String locationName;
  String originName;
  String image;

  Character.fromMap(Map<String, dynamic> map)
      : id = map["id"] ?? 0,
        name = map["name"] ?? "",
        status = map["status"] ?? "",
        species = map["species"] ?? "",
        locationName = map["location"]?["name"] ?? "",
        originName = map["origin"]?["name"] ?? "",
        image = map["image"] ?? "";
}
