import 'package:vegetable/models/vegetable_data.dart';

class Vegetables {
  final String title;
  final String subTitle;
  List<VegetableData> vegetables;

  Vegetables({
    required this.title,
    required this.subTitle,
    required this.vegetables,
  });
}

final VegetablesList = [
  Vegetables(
    title: "Organic Vegetables",
    subTitle: "Pick up from organic farms",
    vegetables: [
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
    ],
  ),
  Vegetables(
    title: "Mixed Vegetables Pack",
    subTitle: "Vegetable mix fresh pack",
    vegetables: [
      VegetableData(
        name: "Multi Vegetables",
        image: "mixed_1.png",
        type: "mixed vegetable",
        rating: "4.5",
        price: 5500,
        isFavorite: false,
      ),
      VegetableData(
        name: "Paper Vegetables",
        image: "mixed_2.png",
        type: "mixed vegetable",
        rating: "4.5",
        price: 4500,
        isFavorite: false,
      ),
      VegetableData(
        name: "Tropicana",
        image: "mixed_3.png",
        type: "mixed vegetable",
        rating: "4.5",
        price: 4000,
        isFavorite: false,
      ),
      VegetableData(
        name: "Mixed Vegetables",
        image: "mixed_4.png",
        type: "mixed vegetable",
        rating: "4.5",
        price: 5500,
        isFavorite: false,
      ),
    ],
  ),
];
