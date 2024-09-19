import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second/iu/views/views.dart';

class PurchaseListPage extends StatefulWidget {
  @override
  _PurchaseListPageState createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  List<Purchase> purchases = [
    Purchase(
      id: 1,
      //date: DateTime(2024, 05, 07),
      product: "Chemise",
      price: 2000,
      //vendor: "Magasin X",
    ),
    Purchase(
      id: 2,
      //date: DateTime(2024, 05, 06),
      product: "Chaussures",
      price: 5000,
      //vendor: "Magasin Y",
    ),
    Purchase(
      id: 3,
      //date: DateTime(2024, 05, 05),
      product: "Livre",
      price: 1000,
      //vendor: "Librairie Z",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des achats"),
      ),
      body: ListView.builder(
        itemCount: purchases.length,
        itemBuilder: (context, index) {
          Purchase purchase = purchases[index];
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("${purchase.product}"),
            subtitle: Text(
                //"Date: ${DateFormat('dd/MM/yyyy').format(purchase.date)}\n"
                "Prix: ${purchase.price} CFA\n"
                //"Vendeur: ${purchase.vendor}",
                ),
          );
        },
      ),
    );
  }
}
