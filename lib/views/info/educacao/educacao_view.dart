import 'package:flutter/material.dart';

class EduSaudeMentalView extends StatefulWidget {
  const EduSaudeMentalView({super.key});

  @override
  State<EduSaudeMentalView> createState() => _EduSaudeMentalViewState();
}

class _EduSaudeMentalViewState extends State<EduSaudeMentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Educação sobre Saúde Mental'),
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
            SectionTitle('O que é Saúde Mental?'),
            SectionText(
              'Saúde mental é o estado de equilíbrio emocional, psicológico e social que permite ao indivíduo lidar com as demandas da vida, '
              'desenvolver suas habilidades, trabalhar de forma produtiva e contribuir com sua comunidade.\n\n'
              'Cuidar da saúde mental não significa estar feliz o tempo todo, mas sim reconhecer os sentimentos, lidar com emoções e buscar ajuda quando necessário.'
            ),
            SizedBox(height: 20),
            SectionTitle('A importância da Educação sobre Saúde Mental'),
            SectionText(
              'A informação é uma ferramenta poderosa para combater o estigma, promover a empatia e incentivar o autocuidado. '
              'Aprender sobre saúde mental permite reconhecer sinais de sofrimento em si mesmo e nos outros, facilitando o acesso precoce a apoio e tratamento.'
            ),
            SizedBox(height: 20),
            SectionTitle('Ansiedade: o que é e como afeta'),
            SectionText(
              'A ansiedade é uma resposta natural do corpo diante de situações de perigo ou estresse. No entanto, quando se torna intensa, frequente ou sem motivo aparente, '
              'pode se transformar em um transtorno.\n\n'
              'Sintomas comuns:\n'
              '• Preocupação excessiva\n'
              '• Coração acelerado\n'
              '• Tensão muscular\n'
              '• Dificuldade para dormir\n'
              '• Sensação de perigo constante\n\n'
              'Transtornos de ansiedade incluem fobia social, transtorno do pânico, transtorno de ansiedade generalizada (TAG) e outros. '
              'O tratamento pode incluir psicoterapia, técnicas de respiração, meditação e, em alguns casos, uso de medicação.'
            ),
            SizedBox(height: 20),
            SectionTitle('Depressão: mais que tristeza'),
            SectionText(
              'A depressão é um transtorno mental comum, caracterizado por tristeza persistente, perda de interesse nas atividades do dia a dia e baixa energia.\n\n'
              'Sintomas incluem:\n'
              '• Sentimento constante de vazio\n'
              '• Alterações no sono e apetite\n'
              '• Dificuldade de concentração\n'
              '• Pensamentos negativos ou autodepreciativos\n'
              '• Desejo de isolamento\n\n'
              'A depressão pode afetar qualquer pessoa, independentemente da idade ou condição social, e deve ser tratada com acompanhamento profissional.'
            ),
            SizedBox(height: 20),
            SectionTitle('Como buscar ajuda'),
            SectionText(
              'É essencial buscar apoio ao perceber sintomas persistentes. O acompanhamento com psicólogos ou psiquiatras pode oferecer tratamento adequado. '
              'Não é sinal de fraqueza pedir ajuda — é um ato de coragem e cuidado consigo mesmo.\n\n'
              'Além disso, conversar com familiares e amigos de confiança pode ajudar no processo de recuperação e acolhimento.'
            ),
            SizedBox(height: 30),
            SectionTitle('Dicas para promover a saúde mental'),
            SectionText(
              '✓ Tenha momentos de lazer e descanso\n'
              '✓ Mantenha uma rotina equilibrada\n'
              '✓ Pratique atividades físicas\n'
              '✓ Desenvolva autoconhecimento\n'
              '✓ Evite o uso excessivo de redes sociais\n'
              '✓ Alimente-se de forma saudável\n'
              '✓ Cultive conexões sociais saudáveis'
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'A saúde mental é parte essencial do bem-estar. Conhecer, respeitar e cuidar da mente é um passo vital para uma vida plena.',
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
