import 'dart:async';

import 'package:flutter/material.dart';

class SessaoRespiracaoView extends StatefulWidget {
  const SessaoRespiracaoView({super.key});

  @override
  State<SessaoRespiracaoView> createState() => _SessaoRespiracaoViewState();
}

class _SessaoRespiracaoViewState extends State<SessaoRespiracaoView> {
  late int inspirar;
  late int segurar;
  late int expirar;

  String faseAtual = '';
  int contador = 0;
  Timer? timer;

  List<Map<String, dynamic>> fases = [];
  int faseIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, int>;

    inspirar = args['inspirar']!;
    segurar = args['segurar']!;
    expirar = args['expirar']!;

    fases = [
      {'fase': 'Inspirar', 'tempo': inspirar},
      {'fase': 'Segurar', 'tempo': segurar},
      {'fase': 'Expirar', 'tempo': expirar},
    ];

    _iniciarFase();
  }

  void _iniciarFase() {
    setState(() {
      faseAtual = fases[faseIndex]['fase'];
      contador = fases[faseIndex]['tempo'];
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (contador > 1) {
        setState(() {
          contador--;
        });
      } else {
        t.cancel();
        faseIndex = (faseIndex + 1) % fases.length;
        _iniciarFase();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Sessão de Respiração'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              faseAtual,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              '$contador s',
              style: const TextStyle(fontSize: 48, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Encerrar Sessão'),
            )
          ],
        ),
      ),
    );
  }
}
