import 'package:flutter/material.dart';

class SobreSerenaView extends StatelessWidget {
  const SobreSerenaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Sobre o Serena'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'SERENA',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF496B33),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              'O Serena é um aplicativo voltado ao auxílio e cuidado com a saúde mental. '
              'Ele oferece recursos de meditação, respiração, informações educativas e '
              'um espaço de acolhimento para os usuários. Nosso objetivo é promover o '
              'bem-estar emocional e apoiar práticas saudáveis para lidar com o estresse '
              'e os desafios do dia a dia.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            const Text(
              'Desenvolvedor:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Richard Peghin da Silva',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Colaborador Técnico:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Dr. Vitor Peghin da silva',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            
            const Text(
              'Orientador:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const Text(
              'Dr. Elvio Gilberto da Silva',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),

            // Logo da universidade
            Center(
              child: Image.asset(
                'lib/assets/icons_principal/logo_unisagrado.jpg',
                width: 250,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),

            const Text(
              'Versão 1.0',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
