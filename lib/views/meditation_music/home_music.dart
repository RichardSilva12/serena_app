
import 'package:flutter/material.dart';

import '../../core/footer.dart';

class MeditationMusicPage extends StatefulWidget {
  const MeditationMusicPage({super.key});

  @override
  MeditationMusicPageState createState() => MeditationMusicPageState();
}

class MeditationMusicPageState extends State<MeditationMusicPage> {

  bool isPlaying = false;
  int currentTrack = 0;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditação com Música'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Ícone representando a música
          const Center(
            child: Icon(Icons.music_note, size: 100, color: Colors.blueAccent),
          ),

          const SizedBox(height: 20),

          // Controles de áudio (play, pause, stop, next)
        

          const SizedBox(height: 40),

          // Botões organizados em GridView
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: const EdgeInsets.all(16),
              children: [
                _buildMeditationButton(context, 'Relaxamento', 'lib/assets/icons/meditation.png', () {}),
                _buildMeditationButton(context, 'Sono', 'lib/assets/icons/timer.png', () {}),
                _buildMeditationButton(context, 'Guiada', 'lib/assets/icons/category.png', () {}),
              ],
            ),
          ),
        ],
      ),

      // Rodapé
      bottomNavigationBar: const AppFooter(currentIndex: 2),
    );
  }

  Widget _buildMeditationButton(BuildContext context, String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 213, 185, 152),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 60, height: 60),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
