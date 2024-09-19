import 'package:flutter/material.dart';
import 'package:second/iu/routing/tab_config.dart';

class Tabb extends StatefulWidget {
  final int? labindex;
  const Tabb({super.key, this.labindex});

  @override
  State<Tabb> createState() => _TabbState();
}

class _TabbState extends State<Tabb> {
  late int navIndex;

  @override
  void initState() {
    super.initState();
    navIndex = widget.labindex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabconfig.elementAt(navIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: navIndex,
        showSelectedLabels: true,
        selectedItemColor: const Color(0xFF000A2B),
        unselectedItemColor: const Color(0xFF000A2B).withOpacity(0.5),
        onTap: (value) {
          setState(() {
            navIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart),
              activeIcon: Icon(Icons.stacked_bar_chart),
              label: 'Statistique'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Achats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Paramètres',
          )
        ],
      ),
    );
  }
}
