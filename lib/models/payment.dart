class Payment {
  final double? price;
  final String? paymentMethod;
  final DateTime? date;
  final String? status;

  Payment({
    this.price,
    this.paymentMethod,
    this.date,
    this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      price: json['price'],
      paymentMethod: json['paymentMethod'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'paymentMethod': paymentMethod,
      'date': date!.toIso8601String(),
      'status': status,
    };
  }
}
