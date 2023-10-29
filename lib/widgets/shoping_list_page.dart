import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_management/models/product_model.dart';

import '../models/data_models.dart';
import 'add_item_page.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});
  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductModel>(
      builder: (context, productModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
          actions: [
            IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => SizedBox(
                  height: 200,
                  child: Consumer<ProductModel>(
                    builder: (context, productModel, child) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Preferences'),
                      content: SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            SwitchListTile(
                                title: const Text('Group by Category'),
                                onChanged: (value) =>
                                    productModel.groupByCategoryChanged(),
                                value: productModel.groupByCategory),
                            SwitchListTile(
                              title: const Text('Move Bought Item down'),
                              onChanged: (value) =>
                                  productModel.moveBoughtDownChanged(),
                              value: productModel.moveBoughtDown,
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .blue), // Change the color as needed
                                // Removes border radius
                              ),
                              child: const Text('Apply'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              icon: const Icon(Icons.tune),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            // products.add(selectedItems[index]);
            //  final item = products[index];
            // productModel.products.add(item);
            return ListTile(
              leading: Icon(
                products[index].category.icon,
                color: Colors.blue,
              ),
              title: Text(products[index].name),
              subtitle: Text(
                  '${products[index].category.name} - ${products[index].quantity}'),
              trailing: Checkbox(
                  value: products[index].isBought,
                  onChanged: (value) {
                    productModel.isBought(value, index);
                    if (products[index].isBought) {
                      //  productModel.addItem(item);
                      // \productModel.product.add(products[index]);
                      // log(productModel.product.length.toString());
                    } else {
                      // productModel.removeItem(item);
                      //   productModel.product.clear();
                    }
                  }),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final item = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddItemPage(),
            ));
            if (item != null) {
              productModel.addItem(item);
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
