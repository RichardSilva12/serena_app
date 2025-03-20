import 'package:flutter/material.dart';

import '../../core/footer.dart'; 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serena', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset('lib/assets/icons/serena_view.png', width: 200, height: 200),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: EdgeInsets.all(16),
              children: [
                _buildHomeButton(context, 'Meditação', 'lib/assets/icons/meditation.png', '/meditacao'),
                _buildHomeButton(context, 'Respiração', 'lib/assets/icons/respiration.png', '/respiracao'),
                _buildHomeButton(context, 'SOS', 'lib/assets/icons/sos.png', '/sos'),
                _buildHomeButton(context, 'Quiz', 'lib/assets/icons/quiz.png', '/quiz'),
                _buildHomeButton(context, 'Informações', 'lib/assets/icons/information.png', '/info'),
                _buildHomeButton(context, 'Músicas', 'lib/assets/icons/music_meditation.png', '/musicas'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppFooter(currentIndex: 0), 
    );
  }

  Widget _buildHomeButton(BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
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
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
