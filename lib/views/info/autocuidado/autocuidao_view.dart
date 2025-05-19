import 'package:flutter/material.dart';

class InfoAutoViewView extends StatefulWidget {
  const InfoAutoViewView({super.key});

  @override
  State<InfoAutoViewView> createState() => _InfoAutoViewViewState();
}

class _InfoAutoViewViewState extends State<InfoAutoViewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Autocuidado Diário'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SectionTitle('Por que o autocuidado é importante?'),
            SectionText(
              'O autocuidado é essencial para manter a saúde mental e o bem-estar emocional. '
              'Pequenas atitudes diárias ajudam a reduzir o estresse, melhorar o humor e aumentar a qualidade de vida.'
            ),
            SizedBox(height: 20),
            SectionTitle('1. Prática regular de exercícios físicos'),
            SectionText(
              'Exercícios ajudam a liberar endorfinas, substâncias responsáveis pela sensação de bem-estar. '
              'Caminhadas, dança, yoga, ou qualquer atividade física contribui para a redução da ansiedade e da depressão.'
            ),
            SizedBox(height: 20),
            SectionTitle('2. Alimentação equilibrada'),
            SectionText(
              'A alimentação tem forte impacto na saúde mental. Consuma alimentos ricos em ômega-3, vitaminas e minerais, como: '
              'peixes, vegetais verdes, frutas, castanhas e sementes. Evite excesso de açúcar e ultraprocessados.'
            ),
            SizedBox(height: 20),
            SectionTitle('3. Qualidade do sono'),
            SectionText(
              'Dormir bem é fundamental. Tente manter uma rotina de sono, evite telas antes de dormir e crie um ambiente tranquilo. '
              'A privação de sono afeta diretamente o humor e a clareza mental.'
            ),
            SizedBox(height: 20),
            SectionTitle('4. Estabeleça uma rotina saudável'),
            SectionText(
              'Ter horários definidos para acordar, trabalhar, comer e descansar ajuda o cérebro a se organizar e promove sensação de controle e segurança.'
            ),
            SizedBox(height: 20),
            SectionTitle('5. Reserve tempo para atividades prazerosas'),
            SectionText(
              'Ler, ouvir música, pintar, conversar com amigos ou simplesmente relaxar. '
              'Essas atividades são importantes para recarregar as energias e manter a mente saudável.'
            ),
            SizedBox(height: 20),
            SectionTitle('6. Pratique a autocompaixão'),
            SectionText(
              'Trate-se com gentileza. Aceite seus erros e limites com compreensão, e valorize suas conquistas, por menores que pareçam.'
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Cuide de você, um passo de cada vez.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF496B33),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        height: 1.4,
        color: Colors.black87,
      ),
    );
  }
}
