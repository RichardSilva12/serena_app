import 'package:flutter/material.dart';

class FerPraticaView extends StatefulWidget {
  const FerPraticaView({super.key});

  @override
  State<FerPraticaView> createState() => _FerPraticaViewState();
}

class _FerPraticaViewState extends State<FerPraticaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Ferramentas Práticas'),
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
            SectionTitle('Ferramentas para cuidar da sua saúde mental'),
            SectionText(
              'Incorporar práticas simples ao seu dia pode ajudar a manter o equilíbrio emocional e o bem-estar. '
              'Aqui estão algumas ferramentas acessíveis que você pode usar no seu cotidiano.'
            ),
            SizedBox(height: 20),
            SectionTitle('1. Respiração Consciente'),
            SectionText(
              'A respiração é uma ponte direta com o sistema nervoso. Exercícios respiratórios ajudam a reduzir o estresse e a ansiedade. '
              'Exemplo: respire fundo por 4 segundos, segure por 4 segundos e solte em 4 segundos. Repita por 2 minutos.'
            ),
            SizedBox(height: 20),
            SectionTitle('2. Meditação Guiada'),
            SectionText(
              'A meditação desenvolve foco e tranquilidade. Você pode usar aplicativos, vídeos ou áudios guiados. Comece com sessões curtas de 5 a 10 minutos por dia.'
            ),
            SizedBox(height: 20),
            SectionTitle('3. Escrita Terapêutica'),
            SectionText(
              'Escrever sobre sentimentos ou acontecimentos do dia ajuda a organizar os pensamentos e aliviar tensões. '
              'Tente manter um diário e escreva sem se preocupar com regras ou julgamentos.'
            ),
            SizedBox(height: 20),
            SectionTitle('4. Exercícios físicos leves'),
            SectionText(
              'Movimentar o corpo libera hormônios do bem-estar, como endorfina e serotonina. Caminhadas, alongamentos ou dançar em casa já fazem diferença.'
            ),
            SizedBox(height: 20),
            SectionTitle('5. Alimentação e sono de qualidade'),
            SectionText(
              'Dormir bem e se alimentar de forma equilibrada melhora o humor, a concentração e a disposição. '
              'Evite o uso excessivo de telas antes de dormir e mantenha uma rotina regular.'
            ),
            SizedBox(height: 20),
            SectionTitle('6. Conexão com pessoas'),
            SectionText(
              'Conversar com alguém de confiança, compartilhar sentimentos ou apenas estar junto com outras pessoas pode aliviar a solidão e fortalecer vínculos.'
            ),
            SizedBox(height: 20),
            SectionTitle('7. Redução do uso de redes sociais'),
            SectionText(
              'Reserve horários específicos para usar redes sociais e evite ficar comparando sua vida com a dos outros. '
              'Lembre-se: o que vemos online é apenas uma parte da realidade.'
            ),
            SizedBox(height: 20),
            SectionTitle('8. Pausas conscientes'),
            SectionText(
              'Durante o dia, tire alguns minutos para se desconectar. Feche os olhos, respire fundo ou observe o ambiente ao seu redor. '
              'Pausas ajudam a renovar a mente e evitar a sobrecarga.'
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Cuidar da saúde mental é um processo contínuo. Escolha uma ferramenta por vez, experimente e descubra o que funciona melhor para você.',
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
        height: 1.5,
        color: Colors.black87,
      ),
    );
  }
}
