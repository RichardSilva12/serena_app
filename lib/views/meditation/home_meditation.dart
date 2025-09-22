import 'package:flutter/material.dart';

import '../../core/footer.dart';

class MeditationView extends StatefulWidget {
  const MeditationView({super.key});

  @override
  MeditationViewState createState() => MeditationViewState();
}

class MeditationViewState extends State<MeditationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF7D5),
        title: const Text(
          'Meditação',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFABEE93).withValues(alpha: 0.4), // verde suave
              const Color(0xFFDDEEC9).withValues(alpha: 0.4), // verde claro suave
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Imagem reduzida
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'lib/assets/images/imagem1.jpg',
                width: 320,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Frase antes dos botões
            const Text(
              " Escolha sua Meditação ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Botões em Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(24),
                children: [
                  _buildMeditationButton(context, 'Guiada',
                      'lib/assets/icons/meditation.png', '/guiaMeditacao'),
                  _buildMeditationButton(context, 'Relaxamento',
                      'lib/assets/icons/relax.png', '/relaxamentoMeditacao'),
                  _buildMeditationButton(context, 'Sono',
                      'lib/assets/icons/lua.png', '/sonoMeditacao'),
                  _buildMeditationButton(context, 'Rápida 5 min',
                      'lib/assets/icons/timer.png', '/rapidaMeditacao'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 2),
    );
  }

  Widget _buildMeditationButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFABEE93), // verde destacado nos botões
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}




