import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final IconData icon;
  Category({required this.id, required this.name, required this.icon});
}

class Product {
  final int id;
  final String name;
  final Category category;
  bool isBought = false;
  final int quantity;
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
  });
}

enum CategoryName { groceries, frozenAndCooledFoods, cleaning, meatAndFish }

Map<CategoryName, Category> categories = {
  CategoryName.groceries: Category(
    id: 1,
    name: 'Groceries',
    icon: Icons.emoji_food_beverage,
  ),
  CategoryName.frozenAndCooledFoods: Category(
    id: 2,
    name: 'Frozen and Cooled Foods',
    icon: Icons.ac_unit,
  ),
  CategoryName.cleaning: Category(
    id: 3,
    name: 'Cleaning',
    icon: Icons.cleaning_services,
  ),
  CategoryName.meatAndFish: Category(
    id: 4,
    name: 'Meats and Fish',
    icon: Icons.set_meal,
  )
};
List<Product> products = [
  Product(
    id: 1,
    name: 'Tea Bags',
    category: categories[CategoryName.groceries]!,
    quantity: 1,
  ),
  Product(
    id: 2,
    name: 'Orange Juice',
    category: categories[CategoryName.frozenAndCooledFoods]!,
    quantity: 2,
  ),
  Product(
    id: 3,
    name: 'Detergent',
    category: categories[CategoryName.cleaning]!,
    quantity: 1,
  ),
  Product(
    id: 4,
    name: 'Milk',
    category: categories[CategoryName.frozenAndCooledFoods]!,
    quantity: 5,
  ),
];
