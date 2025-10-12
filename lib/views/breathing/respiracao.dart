import 'package:flutter/material.dart';

import '../../core/footer.dart';

class RespiracaoView extends StatefulWidget {
  const RespiracaoView({super.key});

  @override
  RespiracaoViewState createState() => RespiracaoViewState();
}

class RespiracaoViewState extends State<RespiracaoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7D5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Respiração',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          // 🔹 ONDA SUPERIOR DIREITA
          Positioned(
            top: 0,
            right: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * 0.7, 180),
              painter: TopRightWavePainter(),
            ),
          ),


          // 🔹 CONTEÚDO PRINCIPAL
          Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Escolha seu tipo de Respiração",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: [
                    _buildBreathingButton(
                      context,
                      '5 minutos',
                      'lib/assets/icons/5min.png',
                      '/rapidaResp',
                    ),
                    _buildBreathingButton(
                      context,
                      'Quadrática',
                      'lib/assets/icons/quadratica_resp.png',
                      '/quadraticaResp',
                    ),
                    _buildBreathingButton(
                      context,
                      'Personalizada',
                      'lib/assets/icons/personalizado_resp.png',
                      '/personalizadaResp',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 3),
    );
  }

  // 🔹 BOTÃO HORIZONTAL MODERNO
  Widget _buildBreathingButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(185, 171, 238, 147),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(imagePath, width: 45, height: 45),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(Icons.play_arrow_rounded,
                color: Color(0xFFABEE93), size: 32),
          ],
        ),
      ),
    );
  }
}

// 🔹 PINTA A ONDA SUPERIOR DIREITA
class TopRightWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFA8E6CF).withValues(alpha: 0.7)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width, 2);
    path.lineTo(size.width, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.6, size.height * 0.8,
      size.width * 0.2, size.height * 0.4,
    );
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


