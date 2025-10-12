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
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF7D5),
        title: const Text(
          'Respiração',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFABEE93).withValues(alpha: 0.4), // verde suave
              const Color(0xFFDDEEC9).withValues(alpha: 0.4), // verde claro suave
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Frase antes dos botões
            const Text(
              " Escolha seu tipo de Respiração ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Grid de botões igual ao da meditação
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: const EdgeInsets.all(24),
                children: [
                  _buildBreathingButton(context, '5 minutos',
                      'lib/assets/icons/5min.png', '/rapidaResp'),
                  _buildBreathingButton(context, 'Quadrática',
                      'lib/assets/icons/quadratica_resp.png', '/quadraticaResp'),
                  _buildBreathingButton(context, 'Personalizada',
                      'lib/assets/icons/personalizado_resp.png', '/personalizadaResp'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 3),
    );
  }

  Widget _buildBreathingButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFABEE93), // verde destacado nos botões
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(2, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 90, height: 90),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
