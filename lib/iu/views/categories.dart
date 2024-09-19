import 'package:flutter/material.dart';
import 'package:second/iu/views/acceuil.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Category> categories = [
    Category(id: 1, name: "Alimentation"),
    Category(id: 2, name: "Vêtements"),
    Category(id: 3, name: "Loisirs"),
    Category(id: 4, name: "Electronique"),
    Category(id: 5, name: "Autres"),
  ];

  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catégories"),
      ),
      body: Column(
        children: [
          // Liste des catégories
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                Category category = categories[index];
                return ListTile(
                  title: Text(category.name),
                  selected: selectedCategory == category,
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
              },
            ),
          ),

          // Liste des achats pour la catégorie sélectionnée
          if (selectedCategory != null)
            Expanded(
              child: ListView.builder(
                itemCount: selectedCategory?.purchases.length,
                itemBuilder: (context, index) {
                  Purchase? purchase = selectedCategory?.purchases[index];
                  return ListTile(
                    title: Text(purchase!.product),
                    subtitle: Text("${purchase.price} CFA"),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  final List<Purchase> purchases;

  Category({required this.id, required this.name, this.purchases = const []});
}
