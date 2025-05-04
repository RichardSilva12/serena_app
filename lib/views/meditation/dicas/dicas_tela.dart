import 'package:flutter/material.dart';

class MeditacaoDicasView extends StatelessWidget {
  const MeditacaoDicasView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> steps = [
      {
        'title': 'Dicas sobre Meditacao',
        'desc': 'Confira algumas orientações para melhorar sua prática meditativa.',
      },
      {
        'title': '🧘‍♀️ Encontre um local tranquilo',
        'desc': 'Escolha um ambiente silencioso, onde você possa se sentar confortavelmente sem interrupções.'
      },
      {
        'title': '👕 Use roupas confortáveis',
        'desc': 'Vista roupas leves que não apertem. Isso ajuda a manter o corpo relaxado durante a prática.'
      },
      {
        'title': '🪑 Sente-se de forma confortável',
        'desc': 'Mantenha a coluna ereta e os ombros relaxados. Use uma almofada ou cadeira, conforme preferir.'
      },
      {
        'title': '🌬️ Concentre-se na respiração',
        'desc': 'Respire profundamente pelo nariz e solte o ar devagar pela boca. Foque nesse ritmo para acalmar a mente.'
      },
      {
        'title': '💭 Observe os pensamentos',
        'desc': 'Não se prenda aos pensamentos. Observe-os como nuvens passando e volte a focar na respiração.'
      },
      {
        'title': '⏱️ Comece com sessões curtas',
        'desc': 'Pratique 5 minutos por dia no início. A constância é mais importante do que a duração.'
      },
      {
        'title': '❤️ Seja gentil com você',
        'desc': 'Não se cobre demais. Meditar é uma jornada, e cada prática é um passo importante.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guia para Meditação'),
        backgroundColor: const Color(0xFFABEE93),
      ),
      body: Container(
        color: const Color(0xFFF5FCE8),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      steps[index]['title']!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      steps[index]['desc']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
