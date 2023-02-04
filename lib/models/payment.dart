class Payment {
  final double? price;
  final String? paymentMethod;
  final DateTime? date;

  Payment({
    this.price,
    this.paymentMethod,
    this.date,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      price: json['price'],
      paymentMethod: json['paymentMethod'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'paymentMethod': paymentMethod,
      'date': date!.toIso8601String(),
    };
  }
}
