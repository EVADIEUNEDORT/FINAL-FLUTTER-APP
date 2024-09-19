import 'dart:async';

import 'package:flutter/material.dart';
import 'package:second/constants/constants.dart';
import 'package:second/iu/views/statistics.dart';
import 'package:second/iu/routing/tabb.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Purchase> recentPurchases = [
    Purchase(id: 1, product: "Chemise", price: 2000),
    Purchase(id: 2, product: "Chaussures", price: 5000),
    Purchase(id: 3, product: "Livre", price: 1000),
  ];
  bool isFresh = true;

  late Future<bool> _isfresh;

  double totalSpending = 8000;
  List<Promotion> currentPromotions = [
    Promotion(
        id: 1,
        title: "Réduction de 20% sur les vêtements",
        description: "Valable jusqu'au 31 mai"),
    Promotion(
        id: 2,
        title: "Livraison gratuite pour les commandes supérieures à 10 000 CFA",
        description: "Sans limite de temps"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isfresh = isFrench();
  }

  Future<bool> isFrench() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isfr = prefs.getBool('isSelectedFrench');
    if (isfr != null) {
      setState(() {
        isFresh = isfr;
      });
      return isfr;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isFresh ? homeFr : homeEn),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Affichages des achats récents
              Text("Achats récents"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: recentPurchases.length,
                itemBuilder: (context, index) {
                  Purchase purchase = recentPurchases[index];
                  return ListTile(
                    title: Text(purchase.product),
                    trailing: Text("${purchase.price} CFA"),
                  );
                },
              ),

              // Affichage des dépenses totales
              Divider(),
              Text("Dépenses totales"),
              Text("${totalSpending} CFA", style: TextStyle(fontSize: 24.0)),

              // Affichage des promotions en cours
              Divider(),
              Text("Promotions en cours"),
              ListView.builder(
                shrinkWrap: true,
                itemCount: currentPromotions.length,
                itemBuilder: (context, index) {
                  Promotion promotion = currentPromotions[index];
                  return ListTile(
                    title: Text(promotion.title),
                    subtitle: Text(promotion.description),
                  );
                },
              ),

              // Bouton pour afficher la page des statistiques
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Tabb(
                              labindex: 1,
                            )),
                  );
                },
                child: const Text('Voir les statistiques'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Purchase {
  final int id;
  final String product;
  final double price;

  Purchase({required this.id, required this.product, required this.price});
}

class Promotion {
  final int id;
  final String title;
  final String description;

  Promotion({required this.id, required this.title, required this.description});
}
