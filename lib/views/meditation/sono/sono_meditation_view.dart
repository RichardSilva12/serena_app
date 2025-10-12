import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MeditacaoSonoView extends StatefulWidget {
  const MeditacaoSonoView({super.key});

  @override
  State<MeditacaoSonoView> createState() => _MeditacaoSonoViewState();
}

class _MeditacaoSonoViewState extends State<MeditacaoSonoView> {
  int? _selectedTimer; // 10, 20, 30 minutos
  bool _isPlaying = false;
  Timer? _autoStopTimer;

  String? _selectedSound;
  late AudioPlayer _player;

  final Map<String, String> soundFiles = {
    "Chuva": "lib/assets/music/chuva.mp3",
    "Mar": "lib/assets/music/mar.mp3",
    "Floresta": "lib/assets/music/floresta.mp3",
    "Lareira": "lib/assets/music/lareira.mp3",
  };

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  Future<void> _playSelectedSound() async {
    if (_selectedSound == null) return;

    final filePath = soundFiles[_selectedSound]!;
    await _player.setAudioSource(
      AudioSource.asset(
        filePath,
        tag: MediaItem(
          id: _selectedSound!,
          album: "Meditação Sono",
          title: _selectedSound!,
          artist: "App Serena",
        ),
      ),
    );

    await _player.setLoopMode(LoopMode.one);
    await _player.play();
  }

  void _togglePlay() async {
    if (_selectedSound == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um som primeiro.")),
      );
      return;
    }
    if (_selectedTimer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um tempo.")),
      );
      return;
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      await _playSelectedSound();
      _startAutoStopTimer();
    } else {
      _player.pause();
      _stopTimer();
    }
  }

  void _reset() {
    _stopTimer();
    _player.stop();
    setState(() {
      _isPlaying = false;
      _selectedTimer = null;
      _selectedSound = null;
    });
  }

  void _startAutoStopTimer() {
    _autoStopTimer?.cancel();
    if (_selectedTimer != null) {
      _autoStopTimer = Timer(Duration(minutes: _selectedTimer!), () {
        _player.stop();
        setState(() {
          _isPlaying = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Tempo encerrado. Som desligado.")),
        );
      });
    }
  }

  void _stopTimer() {
    _autoStopTimer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();
    _player.dispose();
    super.dispose();
  }

  Widget _buildSoundButton(String label, String emoji) {
    final bool isSelected = _selectedSound == label;

    return ElevatedButton.icon(
      onPressed: () => setState(() => _selectedSound = label),
      icon: Text(emoji, style: const TextStyle(fontSize: 24)),
      label: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFFABEE93) : Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
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
            _stopTimer();
            _player.stop();
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Escolha um som relaxante para ajudar a dormir:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                _buildSoundButton("Chuva", "🌧️"),
                _buildSoundButton("Mar", "🌊"),
                _buildSoundButton("Floresta", "🌲"),
                _buildSoundButton("Lareira", "🔥"),
              ],
            ),
            const SizedBox(height: 35),
            const Text(
              "Timer para desligar o som automaticamente:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: const Text("10 min"),
                  selected: _selectedTimer == 10,
                  onSelected: (_) => _selectTimer(10),
                ),
                ChoiceChip(
                  label: const Text("20 min"),
                  selected: _selectedTimer == 20,
                  onSelected: (_) => _selectTimer(20),
                ),
                ChoiceChip(
                  label: const Text("30 min"),
                  selected: _selectedTimer == 30,
                  onSelected: (_) => _selectTimer(30),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFABEE93),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  label: Text(_isPlaying ? "Pausar" : "Começar"),
                  onPressed: _togglePlay,
                ),
                const SizedBox(width: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  icon: const Icon(Icons.refresh),
                  label: const Text("Resetar"),
                  onPressed: _reset,
                ),
              ],
            ),
            const Spacer(),
            const Text(
              "Durma bem e tenha sonhos tranquilos 🌙",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _selectTimer(int? minutes) {
    setState(() {
      _selectedTimer = minutes;
    });
  }
}
