class AllProductModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final double price;
  final List<String> primarylens;
  final List<String> subcategories;
  final List<String> coatings;
  final List<String> thickness;

  AllProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.primarylens,
    required this.subcategories,
    required this.coatings,
    required this.thickness,
  });

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      id: json['_id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      primarylens: List<String>.from(json['primarylens'] ?? []),
      subcategories: List<String>.from(json['subcategories'] ?? []),
      coatings: List<String>.from(json['coatings'] ?? []),
      thickness: List<String>.from(json['thickness'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'primarylens': primarylens,
      'subcategories': subcategories,
      'coatings': coatings,
      'thickness': thickness,
    };
  }
}
