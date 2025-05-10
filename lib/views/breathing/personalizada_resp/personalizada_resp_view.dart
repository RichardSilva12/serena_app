import 'package:flutter/material.dart';

class RespiracaoPersonalizadaView extends StatefulWidget {
  const RespiracaoPersonalizadaView({super.key});

  @override
  State<RespiracaoPersonalizadaView> createState() => _RespiracaoPersonalizadaViewState();
}

class _RespiracaoPersonalizadaViewState extends State<RespiracaoPersonalizadaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Personalizada'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          'Conteúdo em construção...',
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
