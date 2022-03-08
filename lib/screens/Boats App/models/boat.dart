class Boat {
  final String model;
  final String owner;
  final String description;
  final Map<String, String> specs;
  final List<String> gallery;
  final String imagePath;

  const Boat({
    required this.model,
    required this.owner,
    required this.description,
    required this.specs,
    required this.gallery,
    required this.imagePath,
  });

  static const _description =
      "Cum agripeta cantare, omnes humani generises transferre fatalis, gratis gloses.";
  static const _gallery = [
    "assets/images/gallery1.jpg",
    "assets/images/gallery2.jpg",
    "assets/images/gallery3.jpg",
    "assets/images/gallery4.jpg",
    "assets/images/gallery5.jpg",
  ];
  static const _specs = {
    "Boat Length": "24'2",
    "Beam": "102'",
    "Weight": "2765 KG",
    "Fuel Capacity": "322 L"
  };
  static const listBoats = [
    Boat(
        model: "XCLR8 Speed",
        owner: "Tennison",
        imagePath: "assets/images/boat1.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),
    Boat(
        model: "X-FORCE",
        owner: "W - Wilson",
        imagePath: "assets/images/boat2.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),
    Boat(
        model: "X12 Force",
        owner: "Mastercraft",
        imagePath: "assets/images/boat3.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),
    Boat(
        model: "X21 Strength",
        owner: "NeoCraft",
        imagePath: "assets/images/boat4.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),
  ];
}
