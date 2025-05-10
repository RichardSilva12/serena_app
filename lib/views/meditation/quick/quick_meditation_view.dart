import 'package:flutter/material.dart';

class MeditacaoQuickView extends StatefulWidget {
  const MeditacaoQuickView({super.key});

  @override
  State<MeditacaoQuickView> createState() => _MeditacaoQuickViewState();
}

class _MeditacaoQuickViewState extends State<MeditacaoQuickView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Meditação Rápida 5 minutos'),
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
