import 'package:flutter/material.dart';

class MeditacaoRelaxView extends StatefulWidget {
  const MeditacaoRelaxView({super.key});

  @override
  State<MeditacaoRelaxView> createState() => _MeditacaoRelaxViewState();
}

class _MeditacaoRelaxViewState extends State<MeditacaoRelaxView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Relaxamento'),
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
