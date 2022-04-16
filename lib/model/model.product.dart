class Product {
  final dynamic id;
  final dynamic name;
  final dynamic description;
  final dynamic price;
  final dynamic category;
  final dynamic pics;
  final bool newp, discount;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.pics,
    required this.newp,
    required this.discount,
    required this.quantity,
  });

  factory Product.toMap(Map<dynamic, dynamic> map) {
    return Product(
        id: map['_id'],
        name: map['name'],
        description: map['description'],
        price: map['price'],
        category: map['category'],
        pics: map['pictureUrl'],
        newp: map['new'],
        discount: map['discount'],
        quantity: map['quantity']);
  }
}