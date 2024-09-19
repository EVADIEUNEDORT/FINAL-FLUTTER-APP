import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/bloc/auth_bloc.dart';
import 'package:second/iu/ui.dart';
import 'package:second/iu/views/parametre.dart';
import 'package:second/iu/views/connexion.dart';
import 'package:second/services/auth_service.dart';

void main() {
  log("demarage de l'application");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authService: AuthService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      
        // ...
        routes: {
          '/categories': (context) => CategoriesPage(),
          '/connexion': (context) => LoginPage(),
          '/listes des achats': (context) => PurchaseListPage(),
          '/parametres': (context) => const SettingScreen(),
          '/statistics': (context) => StatisticsPage(),
        },
        // ...
      
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
