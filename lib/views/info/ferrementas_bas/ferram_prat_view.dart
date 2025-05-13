import 'package:flutter/material.dart';

class FerPraticaView extends StatefulWidget {
  const FerPraticaView({super.key});

  @override
  State<FerPraticaView> createState() => _FerPraticaViewState();
}

class _FerPraticaViewState extends State<FerPraticaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Ferramentas Praticas'),
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
