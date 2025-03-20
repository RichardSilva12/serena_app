import 'package:flutter/material.dart';

import '../../../core/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 211, 136), // Cor de fundo suave
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Título "Serena"
          const Text(
            'Serena',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif',
            ),
          ),
          const SizedBox(height: 20),

          // Ícone Centralizado CORRETAMENTE
          Center(
            child: Image.asset(
              'lib/assets/icons/serena.png', // Caminho correto da imagem
              width: 200,
            ),
          ),
          const SizedBox(height: 40),

          // Botão "Começar"
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homeView);
            },
            child: const Text(
              'Começar',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
