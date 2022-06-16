class Product {
  final String name;
  final int id;
  final double price;

  const Product({required this.id, required this.name, required this.price});
  String get displayName => '($initials)${name.substring(1)}: \₦$price';
  String get initials => name.substring(0, 1);
}
