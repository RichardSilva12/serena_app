import 'package:flutter/material.dart';

import '../../core/footer.dart'; 

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: Text('Serena', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFEF7D5), // Cor de fundo aplicada aqui
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: EdgeInsets.all(16),
                children: [
                  _buildHomeButton(context, 'Meditação', 'lib/assets/icons/meditation.png', '/meditation'),
                  _buildHomeButton(context, 'Respiração', 'lib/assets/icons/respiration.png', '/breathing'),
                  _buildHomeButton(context, 'Quiz', 'lib/assets/icons/quiz.png', '/quiz'),
                  _buildHomeButton(context, 'Informações', 'lib/assets/icons/information.png', '/info'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppFooter(currentIndex: 0), 
    );
  }

  Widget _buildHomeButton(BuildContext context, String title, String imagePath, String route) {
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
