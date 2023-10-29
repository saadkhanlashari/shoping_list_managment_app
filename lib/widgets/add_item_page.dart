import 'package:flutter/material.dart';

import '../models/data_models.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  bool _nameValid = false;
  Category? _selectedCategory = categories[CategoryName.groceries];
  final _formKey = GlobalKey<FormState>();
  final _itemNameController = TextEditingController();
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Item'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _itemNameController,
                        decoration: InputDecoration(
                          labelText: 'Item Name',
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.emoji_food_beverage),
                          suffixIcon: _nameValid
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : null,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _nameValid = _formKey.currentState!.validate();
                          });
                        },
                        validator: (value) {
                          if (value == null || value.length < 3) {
                            return 'Please add an Item Name at least 3 characters';
                          }
                          return null;
                        }),
                    DropdownButtonFormField<Category>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Category',
                          helperText: 'Please select a category',
                        ),
                        value: _selectedCategory,
                        items: categories.values
                            .map<DropdownMenuItem<Category>>((Category value) {
                          return DropdownMenuItem<Category>(
                              value: value, child: Text(value.name));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a category';
                          }
                          return null;
                        }),
                    TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                        ),
                        initialValue: _quantity.toString(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.parse(value) <= 0) {
                            return 'Quantity must be a number greater than 0';
                          }
                          return null;
                        },
                        onSaved: (_value) {
                          _quantity = int.parse(_value!);
                        }),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.of(context).pop(Product(
                            id: DateTime.now().millisecondsSinceEpoch,
                            name: _itemNameController.text,
                            category: _selectedCategory!,
                            quantity: _quantity,
                          ));
                        }
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text("Add Item"),
                    )
                  ])),
        ));
  }
}
