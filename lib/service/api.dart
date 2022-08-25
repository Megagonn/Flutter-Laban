abstract class Api {
  static String get signup => "https://laban.herokuapp.com/user/signup/";
  static String get allProducts => "https://laban.herokuapp.com/product/products/";
  static String get addToCart => "https://laban.herokuapp.com/cart/add-to-cart/";
  static String get getCart => "https://laban.herokuapp.com/cart/get-cart/";
  static String get increaseCartItem => "https://laban.herokuapp.com/cart/increase-item-count/";
  static String get decreaseCartItem => "https://laban.herokuapp.com/cart/decrease-item-count/";
  static String get clearCart => "https://laban.herokuapp.com/cart/clear-cart/";
  static String get deleteItem => "https://laban.herokuapp.com/cart/delete-item/";
}
