import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/footer.dart';

class MeditationView extends StatefulWidget {
  const MeditationView({super.key});

  @override
  MeditationViewState createState() => MeditationViewState();
}

class MeditationViewState extends State<MeditationView> {
  final List<String> imagePaths = [
    'lib/assets/images/imagem1.jpg',
    'lib/assets/images/imagem2.jpg',
    'lib/assets/images/imagem3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFEF7D5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Meditação',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),

      body: Column(
        children: [
          // 🔹 CARROSSEL DE IMAGENS
          CarouselSlider(
            items: imagePaths.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      path,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.35,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 2200),
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 9,
              initialPage: 0,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Escolha sua Meditação",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 15),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _buildMeditationButton(
                    context, 'Guiada', 'lib/assets/icons/meditation.png', '/guiaMeditacao'),
                _buildMeditationButton(
                    context, 'Relaxamento', 'lib/assets/icons/relax.png', '/relaxamentoMeditacao'),
                _buildMeditationButton(
                    context, 'Sono', 'lib/assets/icons/lua.png', '/sonoMeditacao'),
                _buildMeditationButton(
                    context, 'Rápida 5 min', 'lib/assets/icons/timer.png', '/rapidaMeditacao'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 2),
    );
  }

  // 🔹 BOTÃO ESTILIZADO DE MEDITAÇÃO
  Widget _buildMeditationButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color:const Color.fromARGB(185, 171, 238, 147),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 45, height: 45),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.play_arrow_rounded, color: Color.fromARGB(255, 0, 0, 0), size: 32),
          ],
        ),
      ),
    );
  }
}
