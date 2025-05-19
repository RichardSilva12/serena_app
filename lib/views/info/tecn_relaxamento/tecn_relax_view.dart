import 'package:flutter/material.dart';

class TencRelaxamentoView extends StatefulWidget {
  const TencRelaxamentoView({super.key});

  @override
  State<TencRelaxamentoView> createState() => _TencRelaxamentoViewState();
}

class _TencRelaxamentoViewState extends State<TencRelaxamentoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Técnicas de Relaxamento'),
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
            SectionTitle('Importância do Relaxamento Mental'),
            SectionText(
              'As técnicas de relaxamento são estratégias poderosas para reduzir os níveis de estresse, controlar a ansiedade e melhorar o bem-estar geral. '
              'Elas também auxiliam no tratamento complementar de transtornos como depressão, insônia e síndrome do pânico.'
            ),
            SizedBox(height: 20),
            SectionTitle('1. Respiração Consciente'),
            SectionText(
              'A respiração profunda e controlada ativa o sistema nervoso parassimpático, reduzindo a frequência cardíaca e relaxando o corpo. '
              'Pratique inspirar lentamente pelo nariz, segurar por alguns segundos e expirar pela boca.'
            ),
            SizedBox(height: 20),
            SectionTitle('2. Meditação Guiada'),
            SectionText(
              'Meditações guiadas envolvem ouvir uma voz que conduz a mente a um estado de paz. '
              'Essas práticas reduzem a atividade mental excessiva, promovendo clareza e alívio emocional. Ideal para iniciantes.'
            ),
            SizedBox(height: 20),
            SectionTitle('3. Relaxamento Muscular Progressivo'),
            SectionText(
              'Consiste em tensionar e relaxar grupos musculares do corpo, começando pelos pés e subindo até a cabeça. '
              'É eficaz para reduzir tensões físicas ligadas ao estresse e à ansiedade.'
            ),
            SizedBox(height: 20),
            SectionTitle('4. Mindfulness (Atenção Plena)'),
            SectionText(
              'É a prática de focar totalmente no momento presente, observando os pensamentos e sensações sem julgamento. '
              'O mindfulness ajuda a reduzir ruminações mentais e melhora a regulação emocional.'
            ),
            SizedBox(height: 20),
            SectionTitle('5. Visualização Positiva'),
            SectionText(
              'Técnica onde a pessoa imagina cenários tranquilos (praia, floresta, montanha). Isso induz relaxamento e sensação de segurança, '
              'sendo útil para quem sofre com pensamentos acelerados.'
            ),
            SizedBox(height: 20),
            SectionTitle('6. Aromaterapia e Sons Relaxantes'),
            SectionText(
              'O uso de aromas como lavanda, camomila ou eucalipto, aliado a sons da natureza ou músicas suaves, '
              'pode intensificar o estado de relaxamento e auxiliar na indução ao sono.'
            ),
            SizedBox(height: 20),
            SectionTitle('7. Meditação de Amor e Bondade (Metta)'),
            SectionText(
              'Essa técnica foca em enviar sentimentos de amor e compaixão para si mesmo e para os outros. '
              'É muito eficaz no aumento da empatia, da autoestima e na diminuição de sintomas depressivos.'
            ),
            SizedBox(height: 30),
            SectionTitle('Benefícios das Técnicas de Relaxamento'),
            SectionText(
              '✓ Redução do estresse e da ansiedade\n'
              '✓ Melhora na qualidade do sono\n'
              '✓ Fortalecimento do sistema imunológico\n'
              '✓ Aumento da clareza mental e foco\n'
              '✓ Regulação do humor\n'
              '✓ Apoio no tratamento de transtornos emocionais'
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Incluir o relaxamento na rotina é um ato de cuidado com a mente e o corpo.',
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
