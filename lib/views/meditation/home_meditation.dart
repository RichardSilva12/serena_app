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
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Imagem aumentada
          Flexible(
            flex: 2,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'lib/assets/images/imagem1.jpg',
                  width: 220,
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Botões organizados em Grid
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFDDEEC9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(32),
                children: [
                  _buildMeditationButton(context, 'Guiada', 'lib/assets/icons/meditation.png', '/guiaMeditacao'),
                  _buildMeditationButton(context, 'Relaxamento', 'lib/assets/icons/relax.png', '/'),
                  _buildMeditationButton(context, 'Sono', 'lib/assets/icons/lua.png', '/'),
                  _buildMeditationButton(context, 'Rápida 5 min', 'lib/assets/icons/timer.png', '/'),
                  _buildMeditationButton(context, 'Categoria', 'lib/assets/icons/category.png', '/'),
                  _buildMeditationButton(context, 'Dicas', 'lib/assets/icons/dicas_meditation.png', '/dicasMeditacao'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 2),
    );
  }

  Widget _buildMeditationButton(BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFABEE93),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 70, height: 70),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
