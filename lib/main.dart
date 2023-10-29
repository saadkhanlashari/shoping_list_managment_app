import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_management/models/product_model.dart';

import 'widgets/shoping_list_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductModel>(
            create: (context) => ProductModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoping List Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ShoppingListPage(),
      ),
    );
  }
}
