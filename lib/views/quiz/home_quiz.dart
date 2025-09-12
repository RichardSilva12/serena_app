import 'package:flutter/material.dart';

import '../../core/footer.dart'; // Importa seu footer

class QuizIntroView extends StatelessWidget {
  const QuizIntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        automaticallyImplyLeading: false, // 🔹 remove a seta padrão do lado esquerdo
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'QUIZ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        
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
                  backgroundColor: const Color(0xFFA8E6A1),
                  padding: const EdgeInsets.symmetric(horizontal: 102, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/quizQuestions'),
                child: const Text('Iniciar', style: TextStyle(fontSize: 18, color: Colors.black, // Texto preto
                fontWeight: FontWeight.bold)),
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
