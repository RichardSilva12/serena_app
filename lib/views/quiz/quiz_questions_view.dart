import 'package:flutter/material.dart';
import 'package:serena_app/core/routes.dart';

class QuizQuestionsView extends StatefulWidget {
  const QuizQuestionsView({super.key});

  @override
  State<QuizQuestionsView> createState() => _QuizQuestionsViewState();
}

class _QuizQuestionsViewState extends State<QuizQuestionsView> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Como você se sente hoje?',
      'options': [
        {'text': 'Tranquilo(a)', 'value': 0},
        {'text': 'Ansioso(a)', 'value': 1},
        {'text': 'Sobrecarregado(a)', 'value': 2},
      ]
    },
    {
      'question': 'Você tem conseguido dormir bem?',
      'options': [
        {'text': 'Sim, sem problemas', 'value': 0},
        {'text': 'Mais ou menos', 'value': 1},
        {'text': 'Tenho tido insônia ou pesadelos', 'value': 2},
      ]
    },
    {
      'question': 'Tem sentido dificuldade para respirar ou palpitações?',
      'options': [
        {'text': 'Não', 'value': 0},
        {'text': 'Às vezes', 'value': 1},
        {'text': 'Com frequência', 'value': 2},
      ]
    },
    {
      'question': 'Você sente dificuldade para se concentrar nas tarefas?',
      'options': [
        {'text': 'Não, foco normalmente', 'value': 0},
        {'text': 'Às vezes me distraio', 'value': 1},
        {'text': 'Quase sempre me distraio', 'value': 2},
      ]
    },
    {
      'question': 'Tem se sentido desmotivado(a) ultimamente?',
      'options': [
        {'text': 'Não, estou motivado(a)', 'value': 0},
        {'text': 'Depende do dia', 'value': 1},
        {'text': 'Sim, totalmente desmotivado(a)', 'value': 2},
      ]
    },
  ];

  void _answerQuestion(int value) {
    setState(() {
      _score += value;
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= _questions.length) {
      _showResult();
    }
  }

  void _showResult() {
   WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (_score <= 4) {
            return _buildResultScreen(
              'Você está bem!',
              'Que ótimo! Continue mantendo sua mente tranquila. Que tal uma meditação para manter o equilíbrio?',
              'Começar Meditação',
              AppRoutes.meditation,
            );
          } else if (_score <= 7) {
            return _buildResultScreen(
              'Atenção!',
              'Você está um pouco sobrecarregado(a). Vamos fazer um exercício de respiração?',
              'Começar Respiração',
              AppRoutes.breathing,
            );
          } else {
            return _buildResultScreen(
              'Cuidado!',
              'Seu nível emocional está crítico. Recomendamos buscar apoio profissional. Veja os contatos disponíveis.',
              'Ver Contatos',
              AppRoutes.contatos,
            );
          }
        },
      ),
    );
   });
  }


  Widget _buildResultScreen(String title, String description, String buttonText, String route) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA8E6A1),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () => Navigator.pushNamed(context, route),
              child: Text(buttonText, style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentQuestionIndex >= _questions.length) {
      return const Center(child: CircularProgressIndicator());
    }

    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas do Quiz'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pergunta ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...currentQuestion['options'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA8E6A1),
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  ),
                  onPressed: () => _answerQuestion(option['value']),
                  child: Text(option['text'], style: const TextStyle(fontSize: 16, color: Colors.black, // Texto preto
                  fontWeight: FontWeight.bold,)),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
