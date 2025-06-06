import 'package:flutter/material.dart';

class MeditacaoCategoryView extends StatefulWidget {
  const MeditacaoCategoryView({super.key});

  @override
  State<MeditacaoCategoryView> createState() => _MeditacaoCategoryViewState();
}

class _MeditacaoCategoryViewState extends State<MeditacaoCategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Categorias de Meditacao'),
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
