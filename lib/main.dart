import 'package:flutter/material.dart';

import 'core/routes.dart';

void main() {
  runApp(const SerenaApp());
}

class SerenaApp extends StatelessWidget {
  const SerenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serena',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: AppRoutes.home, // Define a tela inicial
      routes: AppRoutes.routes, // Registra as rotas definidas em routes.dart
    );
  }
}
