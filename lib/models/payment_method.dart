class PaymentMethod {
  const PaymentMethod({
    required this.name,
    this.url,
    this.description,
  });

  PaymentMethod.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'description': description,
      };

  final String name;
  final String? url;
  final String? description;
}
