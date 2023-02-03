class VegetableData {
  String? name;
  String? image;
  String? type;
  String? rating;
  int? price;
  bool? isFavorite;

  VegetableData({
    required this.name,
    required this.image,
    required this.type,
    required this.rating,
    required this.price,
    required this.isFavorite,
  });
}

// dummy data
List<VegetableData> allVegetables = [
  VegetableData(
    name: "Brinjal",
    image: "brinjal.png",
    type: "organic vegetable",
    rating: "4.5",
    price: 2500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Ginger",
    image: "ginger.png",
    type: "organic vegetable",
    rating: "4.5",
    price: 4500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Corriander",
    image: "corriander.png",
    type: "organic vegetable",
    rating: "4.5",
    price: 1500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Garlic",
    image: "garlic.png",
    type: "organic vegetable",
    rating: "4.5",
    price: 5500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Multi Vegetables",
    image: "mixed_1.png",
    type: "mixed vegetable",
    rating: "4.5",
    price: 5500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Multi Vegetables",
    image: "mixed_2.png",
    type: "mixed vegetable",
    rating: "4.5",
    price: 5500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Multi Vegetables",
    image: "mixed_3.png",
    type: "mixed vegetable",
    rating: "4.5",
    price: 5500,
    isFavorite: false,
  ),
  VegetableData(
    name: "Multi Vegetables",
    image: "mixed_4.png",
    type: "mixed vegetable",
    rating: "4.5",
    price: 5500,
    isFavorite: false,
  ),
];
