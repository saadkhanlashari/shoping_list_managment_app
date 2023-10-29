import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_list_management/models/data_models.dart';

class ProductModel with ChangeNotifier {
  // List<Product> products = [];
  bool groupByCategory = false;
  bool moveBoughtDown = false;

  bool isbought = false;
  void isBought(value, index) {
    products[index].isBought = value!;
    // log(product[index].name.toString());
    notifyListeners();
  }

  // Methods to add, remove, and change items from the list
  void addItem(Product item) {
    products.add(item);
    notifyListeners();
  }

  void removeItem(Product item) {
    products.remove(item);
    notifyListeners();
  }

  void itemBoughtChanged(Product item) {
    item.isBought = !item.isBought;
    notifyListeners();
  }

  void groupByCategoryChanged() {
    groupByCategory = !groupByCategory;

    // Check if groupByCategory is true to sort products by category
    if (groupByCategory) {
      products.sort((a, b) {
        return a.category.id - b.category.id;
      });
    } else {
      // If groupByCategory is false, sort products back to their original order (e.g., by ID)
      products.sort((a, b) {
        return a.id - b.id;
      });
    }

    notifyListeners();
  }

  void moveBoughtDownChanged() {
    moveBoughtDown = !moveBoughtDown;
    // log(moveBoughtDown.toString());
    if (moveBoughtDown) {
      log(moveBoughtDown.toString());
      // Sort products to move bought items down
      products.sort((a, b) {
        if (a.isBought && !b.isBought) {
          return 1;
        } else if (!a.isBought && b.isBought) {
          return -1;
        } else {
          return 0;
        }
      });
    } else if (!moveBoughtDown) {
      log(moveBoughtDown.toString());
      // Revert to the original order (no sorting)
      products.sort((a, b) {
        return a.id - b.id;
      });
    }

    notifyListeners();
  }
}
