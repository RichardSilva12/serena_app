import 'package:flutter/material.dart';

import '../../core/footer.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'INFORMAÇÕES',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoSection(
              context,
              emoji: '📌',
              title: 'Dicas e Informações sobre Saúde Mental',
              routeName: '/infoDicas',
              showButton: false,
            ),
            _buildInfoSection(
              context,
              emoji: '🧼',
              title: 'Autocuidado Diário',
              routeName: '/infoAutocuidado',
            ),
            _buildInfoSection(
              context,
              emoji: '🧘‍♀️',
              title: 'Técnicas de Relaxamento',
              routeName: '/infoRelaxamento',
            ),
            _buildInfoSection(
              context,
              emoji: '📖',
              title: 'Educação sobre Saúde Mental',
              routeName: '/infoEducacao',
            ),
            _buildInfoSection(
              context,
              emoji: '🛠️',
              title: 'Ferramentas Práticas',
              routeName: '/infoFerramentas',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 0),
    );
  }

  /// Função auxiliar para construir os blocos de informação
  Widget _buildInfoSection(
    BuildContext context, {
    required String emoji,
    required String title,
    required String routeName,
    bool showButton = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$emoji $title',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      const SizedBox(height: 10),
      if (showButton)
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[400],
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, routeName),
          child: const Text('Saiba mais', style: TextStyle(fontSize: 16)),
        ),
      const SizedBox(height: 30),
      ],
    );
  }
}