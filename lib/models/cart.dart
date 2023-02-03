class Cart {
  final String? name;
  final String? image;
  int? quantity;
  final double? price;

  Cart({
    this.name,
    this.image,
    this.quantity,
    this.price,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      name: json['name'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
