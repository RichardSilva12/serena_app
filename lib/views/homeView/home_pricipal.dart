import 'package:flutter/material.dart';

import '../../core/footer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text(
          'Serena',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFABEE93), Color(0xFFFEF7D5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Mensagem de boas-vindas
            const Text(
              "🌿 Bem-vindo ao Serena 🌿",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Grid de botões
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildHomeButton(
                      context, 'Meditação', 'lib/assets/icons/meditation.png', '/meditation'),
                  _buildHomeButton(
                      context, 'Respiração', 'lib/assets/icons/respiration.png', '/breathing'),
                  _buildHomeButton(context, 'Quiz', 'lib/assets/icons/quiz.png', '/quiz'),
                  _buildHomeButton(
                      context, 'Informações', 'lib/assets/icons/information.png', '/info'),
                ],
              ),
            ),

            // Card de dica/frase do dia
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.black.withValues(alpha: 0.05),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "💡 Dica do dia: Reserve 5 minutos para respirar fundo e relaxar.",
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 0),
    );
  }

  Widget _buildHomeButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFABEE93),
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 90, height: 90),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
