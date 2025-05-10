import 'package:flutter/material.dart';

class RespiracaoQuadraticaView extends StatefulWidget {
  const RespiracaoQuadraticaView({super.key});

  @override
  State<RespiracaoQuadraticaView> createState() => _RespiracaoQuadraticaViewState();
}

class _RespiracaoQuadraticaViewState extends State<RespiracaoQuadraticaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Respiracao Quadratica'),
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
