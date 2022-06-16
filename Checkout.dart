// ignore_for_file: unused_local_variable

import "dart:io";

import 'Cart.dart';
import 'Product.dart';

void main(List<String> args) {
  final cart = Cart();
  while (true) {
    stdout.write(
        'What do you want to do..? (v)iew item, (a)dd item, (c)heckout: ');
    final line = stdin.readLineSync();

    switch (line) {
      case "v":
        break;
      case "a":
        final product = chooseProduct();
        if (product != null) {
          cart.addtoCart(product);
          print(cart);
        }
        break;
      case "c":
        if (checkout(cart)) {
          break;
        }
        break;
      default:
        print('error');
    }
  }
}

const allProduct = [
  Product(id: 1, name: "Rice", price: 35.500),
  Product(id: 2, name: "Tuber of yam", price: 3000),
  Product(id: 3, name: "Chicken", price: 3500),
  Product(id: 4, name: "Fish", price: 1500),
  Product(id: 5, name: "Gari", price: 1200),
];

Product? chooseProduct() {
  final productlist = allProduct.map((e) => e.displayName).join('\n');
  stdout.write('Available products:\n$productlist\nYour choice ');
  final line = stdin.readLineSync();
  for (var product in allProduct) {
    if (product.initials == line) {
      return product;
    }
  }

  print('product not found');
  return null;
}

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total: ₦$total');
  stdout.write('Pay in cash: ');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print('change is ₦${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash. ');
    return false;
  }
}
