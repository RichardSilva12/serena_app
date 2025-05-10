import 'package:flutter/material.dart';

class MeditacaoSonoView extends StatefulWidget {
  const MeditacaoSonoView({super.key});

  @override
  State<MeditacaoSonoView> createState() => _MeditacaoSonoViewState();
}

class _MeditacaoSonoViewState extends State<MeditacaoSonoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Sono'),
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
