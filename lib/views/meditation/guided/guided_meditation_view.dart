import 'dart:async';

import 'package:flutter/material.dart';

class MeditacaoGuiadaView extends StatefulWidget {
  const MeditacaoGuiadaView({super.key});

  @override
  State<MeditacaoGuiadaView> createState() => _MeditacaoGuiadaViewState();
}

class _MeditacaoGuiadaViewState extends State<MeditacaoGuiadaView> {
  bool isSoundOn = true;
  bool isPaused = false;
  int currentStepIndex = 0;
  Timer? timer;

  final List<String> guidedSteps = [
    'Sente-se confortavelmente e feche os olhos.',
    'Respire profundamente pelo nariz...',
    'Solte o ar lentamente pela boca.',
    'Deixe os pensamentos irem e virem, sem se apegar.',
    'Foque apenas na sua respiração...',
    'Sinta seu corpo relaxar a cada expiração.',
    'Se distrações surgirem, volte suavemente à respiração.',
    'Aprecie esse momento de silêncio e presença.',
  ];

  @override
  void initState() {
    super.initState();
    startMeditation();
  }

  void startMeditation() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (!isPaused) {
        setState(() {
          currentStepIndex = (currentStepIndex + 1) % guidedSteps.length;
        });
      }
    });
  }

  void togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void restartMeditation() {
    setState(() {
      currentStepIndex = 0;
      isPaused = false;
    });
  }

  void toggleSound() {
    setState(() {
      isSoundOn = !isSoundOn;
    });

    // Aqui você pode adicionar o controle real do áudio
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Meditação Guiada'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Texto de meditação atual
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Text(
              guidedSteps[currentStepIndex],
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Estado atual (rodando, pausado)
          Text(
            isPaused ? 'Pausado' : 'Em andamento...',
            style: TextStyle(
              fontSize: 16,
              color: isPaused ? Colors.red : Colors.green,
            ),
          ),

          const Spacer(),

          // Botões principais
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Botão Pausar/Reiniciar
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFABEE93),
                ),
                onPressed: togglePause,
                icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
                label: Text(isPaused ? 'Retomar' : 'Pausar'),
              ),
              const SizedBox(width: 16),
              // Botão Reiniciar
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFABEE93),
                ),
                onPressed: restartMeditation,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reiniciar'),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Botão de som
          GestureDetector(
            onTap: toggleSound,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFABEE93),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              padding: const EdgeInsets.all(30),
              child: Icon(
                isSoundOn ? Icons.volume_up : Icons.volume_off,
                size: 80,
                color: Colors.black87,
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
