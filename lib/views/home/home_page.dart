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

          // Conteúdo da tela (botão, imagem e logo)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Center(
                child: Image.asset(
                  'lib/assets/icons/serena.png',
                  width: 500,
                  height: 400,
                ),
              ),
              const SizedBox(height: 40),

              // Botão COMEÇAR
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _scale = 0.9;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _scale = 1.0;
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

              const SizedBox(height: 30),

              // Logo da faculdade
              Image.asset(
                'lib/assets/icons_principal/unisagrado-transparente.png', // coloque sua logo em assets
                width: 150,
                height: 100,
              ),
            ],
          ),

          // Botão de informação no canto inferior esquerdo
          Positioned(
            bottom: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.info, size: 32, color: Colors.black87),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.sobre);
              },
            ),
          ),
        ],
      ),
    );
  }
}
