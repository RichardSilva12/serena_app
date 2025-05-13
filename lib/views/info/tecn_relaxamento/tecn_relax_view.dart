import 'package:flutter/material.dart';

class TencRelaxamentoView extends StatefulWidget {
  const TencRelaxamentoView({super.key});

  @override
  State<TencRelaxamentoView> createState() => _TencRelaxamentoViewState();
}

class _TencRelaxamentoViewState extends State<TencRelaxamentoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Tecnicas de Relaxamento'),
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
