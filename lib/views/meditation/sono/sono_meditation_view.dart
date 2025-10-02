import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MeditacaoSonoView extends StatefulWidget {
  const MeditacaoSonoView({super.key});

  @override
  State<MeditacaoSonoView> createState() => _MeditacaoSonoViewState();
}

class _MeditacaoSonoViewState extends State<MeditacaoSonoView> {
  String? somSelecionado;
  bool isPlaying = false;
  int tempoSelecionado = 15;
  Timer? _timer;
  int _tempoRestante = 0;

  final AudioPlayer _player = AudioPlayer();

  final Map<String, String> sons = {
    'Chuva': '🌧️',
    'Mar': '🌊',
    'Floresta': '🌲',
    'Lareira': '🔥',
  };

  // Caminhos dos sons (adicione os arquivos no pubspec.yaml)
  final Map<String, String> _audioFiles = {
    'Chuva': 'assets/sounds/chuva.mp3',
    'Mar': 'assets/sounds/mar.mp3',
    'Floresta': 'assets/sounds/floresta.mp3',
    'Lareira': 'assets/sounds/lareira.mp3',
  };

  Future<void> selecionarSom(String nome) async {
    _timer?.cancel();
    await _player.stop();

    final path = _audioFiles[nome];
    if (path == null) return;

    try {
      
      await _player.setAsset(path);
      await _player.setLoopMode(LoopMode.one);

      await _player.play();

      setState(() {
        somSelecionado = nome;
        isPlaying = true;
        _tempoRestante = tempoSelecionado * 60;
      });

      iniciarTemporizador();
    } catch (e) {
      debugPrint("Erro ao carregar som: $e");
    }
  }

  Future<void> pausarSom() async {
    if (isPlaying) {
      await _player.pause();
      _timer?.cancel();
    } else {
      await _player.play();
      iniciarTemporizador();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  Future<void> reiniciarSom() async {
    await _player.stop();
    _timer?.cancel();
    setState(() {
      somSelecionado = null;
      isPlaying = false;
      _tempoRestante = 0;
    });
  }

  void iniciarTemporizador() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_tempoRestante > 0 && isPlaying) {
        setState(() {
          _tempoRestante--;
        });
      } else {
        timer.cancel();
        await _player.stop();
        setState(() {
          isPlaying = false;
        });
      }
    });
  }

  void abrirTemporizador() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [15, 30, 60].map((tempo) {
            return ListTile(
              title: Text('$tempo minutos'),
              onTap: () {
                setState(() {
                  tempoSelecionado = tempo;
                  _tempoRestante = tempo * 60;
                });
                if (isPlaying) iniciarTemporizador();
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  String formatarTempo(int segundos) {
    final minutos = (segundos ~/ 60).toString().padLeft(2, '0');
    final seg = (segundos % 60).toString().padLeft(2, '0');
    return '$minutos:$seg';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Sono'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _timer?.cancel();
              _player.stop(); // sem await, roda em paralelo
              Navigator.pop(context);
            },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Escolha um som relaxante para ajudar a dormir:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: sons.entries.map((entry) {
                final isSelected = somSelecionado == entry.key;
                return GestureDetector(
                  onTap: () => selecionarSom(entry.key),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green[200] : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(entry.value, style: const TextStyle(fontSize: 32)),
                        const SizedBox(height: 8),
                        Text(entry.key, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            if (somSelecionado != null) ...[
              Text(
                'Tocando: $somSelecionado',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Tempo restante: ${formatarTempo(_tempoRestante)}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              IconButton(
                iconSize: 60,
                icon: Icon(
                  isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                  color: Colors.green[700],
                ),
                onPressed: pausarSom,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: abrirTemporizador,
                icon: const Icon(Icons.timer),
                label: Text('Temporizador: $tempoSelecionado min'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: reiniciarSom,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[200],
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
