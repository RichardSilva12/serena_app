import 'package:flutter/material.dart';

class InfoAutoViewView extends StatefulWidget {
  const InfoAutoViewView({super.key});

  @override
  State<InfoAutoViewView> createState() => _InfoAutoViewViewState();
}

class _InfoAutoViewViewState extends State<InfoAutoViewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Autocuidado Diario'),
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
