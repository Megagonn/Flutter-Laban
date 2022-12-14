class Product {
  final dynamic id;
  final dynamic name;
  final dynamic description;
  final dynamic price;
  final dynamic shippingFee;
  final dynamic category;
  final dynamic pics;
  final bool discount;
  final int quantity;

  Product({
    required this.shippingFee,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.pics,
    required this.discount,
    required this.quantity,
  });

  factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      id: map['productId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      pics: map['pictureUrl'],
      discount: map['discount'],
      quantity: map['quantity'],
      shippingFee: map['shippingFee'],
    );
  }
  factory Product.fromMapCart(Map<dynamic, dynamic> map) {
    return Product(
      id: map['productId'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      category: map['category'],
      pics: map['image'],
      discount: map['discount'] ?? false,
      quantity: map['quantity'] ?? 20,
      shippingFee: map['shippingFee'],
    );
  }
  Map<String, dynamic> toMap(map, int count) {
    return {
      "name": map.name,
      "image": map.pics,
      "productId": map.pics,
      "price": map.price,
      "category": map.category,
      "description": map.description,
      "shippingFee": map.shippingFee,
      "count": count,
    };
  }
}
// '''
//             CREATE TABLE favourite (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price TEXT, category TEXT, description TEXT, image TEXT, shipping_fee INTEGER,)
//           '''