import 'package:flutter/material.dart';
import 'package:second/iu/ui.dart';
import 'package:second/iu/views/acceuil.dart';
import 'package:second/iu/views/parametre.dart';
import 'package:second/iu/views/statistics.dart';

import '../views/listes_des_achats.dart';

List<Widget> tabconfig = <Widget>[
  const HomePage(),
  StatisticsPage(),
  PurchaseListPage(),
  SettingScreen(),
];
