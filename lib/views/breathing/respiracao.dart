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
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Seção dos botões ocupando o restante da tela
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFDDEEC9), // Cor de fundo da seção
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildBreathingButton(
                      context, '5 minutos', 'lib/assets/icons/5min.png', '/rapidaResp'),
                  _buildBreathingButton(
                      context, 'Quadratica', 'lib/assets/icons/quadratica_resp.png', '/quadraticaResp'),
                  _buildBreathingButton(context, 'Personalizada',
                      'lib/assets/icons/personalizado_resp.png', '/personalizadaResp'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppFooter(currentIndex: 3),
    );
  }

  Widget _buildBreathingButton(
      BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xFFABEE93),
          shape: BoxShape.circle, // Deixando os botões circulares
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 90, height: 90), // Aumentando os ícones
            const SizedBox(height: 6),
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
