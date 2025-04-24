import 'package:flutter/material.dart';

import '../../core/footer.dart'; // Importa seu footer

class QuizIntroView extends StatelessWidget {
  const QuizIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'QUIZ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {}, // Implementar Drawer se quiser
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '📌 Bem-vindo ao Seu Momento de Equilíbrio!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Queremos te ajudar a compreender melhor seu estado emocional. '
                'Responda algumas perguntas simples e, com base nas suas respostas, '
                'te daremos recomendações personalizadas para relaxamento e bem-estar.\n\n'
                '✨ Descubra se o momento pede uma meditação, um exercício de respiração '
                'ou, talvez, o apoio de um profissional.\n\n'
                '🧘‍♀️ Tudo de forma leve, rápida e focada no seu bem-estar!',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/quizQuestions'),
                child: const Text('Iniciar', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 0), // Defina o índice correspondente
    );
  }
}
