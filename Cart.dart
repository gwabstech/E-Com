import 'dart:math';

import 'Item.dart';
import 'Product.dart';

class Cart {
  final Map<int, Item> _items = {};

  @override
  String toString() {
    if (_items.isEmpty) {
      return 'Cart is empty';
    }
    final itemlist = _items.values.map((e) => e.toString()).join('\n');
    return '--------\n$itemlist\n ₦${total()}\n---------';
  }

  bool get isEmpty => _items.isEmpty;

  double total() => _items.values
      .map((e) => e.price)
      .reduce((value, element) => value + element);

  void addtoCart(Product proct) {
    final item = _items[proct.id];
    if (item == null) {
      _items[proct.id] = Item(product: proct, quantity: 1);
    } else {
      _items[proct.id] = Item(product: proct, quantity: item.quantity + 1);
    }
  }
}
