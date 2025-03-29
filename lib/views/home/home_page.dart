import 'package:flutter/material.dart';

import '../../../core/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Variável para controlar o tamanho da animação
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7D5), // Cor de fundo suave
      body: Stack(
        children: [
          // Círculo superior esquerdo
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // ignore: deprecated_member_use
                color: const Color(0xFF7ED957).withOpacity(0.3), // Cor verde
              ),
            ),
          ),

          // Círculo inferior direito
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // ignore: deprecated_member_use
                color: const Color(0xFF7ED957).withOpacity(0.3), // Cor verde
              ),
            ),
          ),

          // Conteúdo da tela (botão e imagem)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Ícone Centralizado CORRETAMENTE
              Center(
                child: Image.asset(
                  'lib/assets/icons/serena.png', // Caminho correto da imagem
                  width: 500,
                  height: 400,
                ),
              ),
              const SizedBox(height: 40),

              // Botão "Começar" com animação
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _scale = 0.9; // Diminuir o tamanho ao pressionar
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _scale = 1.0; // Retornar ao tamanho original após pressionar
                  });
                },
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.homeView);
                },
                child: AnimatedScale(
                  scale: _scale,
                  duration: const Duration(milliseconds: 200),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFABEE93),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.homeView);
                    },
                    child: const Text(
                      'COMEÇAR',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
