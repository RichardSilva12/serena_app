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
          // esquerdo
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(126, 217, 87, 0.2),
              ),
            ),
          ),

          // direito
          Positioned(
            bottom: -100,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromRGBO(126, 217, 87, 0.3),
              ),
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



