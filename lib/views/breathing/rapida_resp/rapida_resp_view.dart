import 'package:flutter/material.dart';

class RespiracaoRapidaView extends StatefulWidget {
  const RespiracaoRapidaView({super.key});

  @override
  State<RespiracaoRapidaView> createState() => _RespiracaoRapidaViewState();
}

class _RespiracaoRapidaViewState extends State<RespiracaoRapidaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('5 minutos - Respiracao'),
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
