import 'package:flutter/material.dart';

import '../../core/footer.dart';

class MeditationView extends StatefulWidget {
  const MeditationView({super.key});

  @override
  MeditationViewState createState() => MeditationViewState();
}

class MeditationViewState extends State<MeditationView> {
  bool isMusicMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF7D5),
        title: const Text('Meditação', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Alternador entre Meditação e Meditação com Música
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildToggleButton('Meditação', !isMusicMode, () {
                setState(() => isMusicMode = false);
              }),
              const SizedBox(width: 10),
              _buildToggleButton('Com Música', isMusicMode, () {
                setState(() => isMusicMode = true);
              }),
            ],
          ),
          const SizedBox(height: 20),

          // Imagem centralizada
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'lib/assets/images/imagem1.jpg',
                width: 180,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Seção dos botões ocupando o restante da tela
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFDDEEC9), // Cor de fundo da seção
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: isMusicMode
                    ? [
                        _buildMeditationButton(context, 'Relaxamento', 'lib/assets/icons/relax.png', '/'),
                        _buildMeditationButton(context, 'Sono', 'lib/assets/icons/lua.png', '/'),
                        _buildMeditationButton(context, 'Guiada', 'lib/assets/icons/meditation.png', '/'),
                      ]
                    : [
                        _buildMeditationButton(context, 'Guiada', 'lib/assets/icons/meditation.png', '/'),
                        _buildMeditationButton(context, 'Rápida 5 min', 'lib/assets/icons/timer.png', '/'),
                        _buildMeditationButton(context, 'Categoria', 'lib/assets/icons/category.png', '/'),
                      ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 2),
    );
  }

  Widget _buildToggleButton(String title, bool isSelected, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildMeditationButton(BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xFFABEE93),
          shape: BoxShape.circle, // Deixando os botões circulares
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 90, height: 90), // Aumentando os ícones
            SizedBox(height: 6),
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
