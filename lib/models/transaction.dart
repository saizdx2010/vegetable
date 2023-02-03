class Transaction {
  final double? price;
  final String? paymentMethod;
  final DateTime? date;

  Transaction({
    this.price,
    this.paymentMethod,
    this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
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
