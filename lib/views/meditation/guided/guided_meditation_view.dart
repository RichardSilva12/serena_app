import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MeditacaoGuiadaView extends StatefulWidget {
  const MeditacaoGuiadaView({super.key});

  @override
  State<MeditacaoGuiadaView> createState() => _MeditacaoGuiadaViewState();
}

class _MeditacaoGuiadaViewState extends State<MeditacaoGuiadaView> {
  bool isPlaying = false;
  bool isPaused = false;
  int currentStepIndex = 0;
  Timer? timer;
  late AudioPlayer _player;

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
    _player = AudioPlayer();
    _player.setAudioSource(
      AudioSource.asset(
        'lib/assets/music/audio_guiado.mp3',
        tag: MediaItem(
          id: '1',
          title: 'Meditação Guiada',
          album: 'Serena',
          artist: 'App Serena',
        ),
      ),
    );
  }

  void startMeditation() {
    setState(() {
      isPlaying = true;
      isPaused = false;
    });
    _player.play();

    timer = Timer.periodic(const Duration(seconds: 20), (timer) {
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
      if (isPaused) {
        _player.pause();
      } else {
        _player.play();
      }
    });
  }

  void restartMeditation() {
    setState(() {
      currentStepIndex = 0;
      isPaused = false;
      isPlaying = false;
    });
    _player.seek(Duration.zero);
  }

  @override
  void dispose() {
    timer?.cancel();
    _player.dispose();
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

          // Estado atual
          Text(
            isPaused
                ? 'Pausado'
                : isPlaying
                    ? 'Em andamento...'
                    : 'Pronto para iniciar',
            style: TextStyle(
              fontSize: 16,
              color: isPaused
                  ? Colors.red
                  : isPlaying
                      ? Colors.green
                      : Colors.black87,
            ),
          ),

          const Spacer(),

          // Botão Começar (inicia áudio e frases)
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFABEE93),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            onPressed: isPlaying ? null : startMeditation,
            icon: const Icon(Icons.play_arrow),
            label: const Text('Começar'),
          ),

          const SizedBox(height: 20),

          // Botões Pausar e Reiniciar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: isPlaying ? togglePause : null,
                icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
                label: Text(isPaused ? 'Retomar' : 'Pausar'),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: isPlaying ? restartMeditation : null,
                icon: const Icon(Icons.restart_alt),
                label: const Text('Reiniciar'),
              ),
            ],
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
