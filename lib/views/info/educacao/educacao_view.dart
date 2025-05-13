import 'package:flutter/material.dart';

class EduSaudeMentalView extends StatefulWidget {
  const EduSaudeMentalView({super.key});

  @override
  State<EduSaudeMentalView> createState() => _EduSaudeMentalViewState();
}

class _EduSaudeMentalViewState extends State<EduSaudeMentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Educacao sobre Saude Mental'),
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
