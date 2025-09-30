import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class MeditacaoRelaxView extends StatefulWidget {
  const MeditacaoRelaxView({super.key});

  @override
  State<MeditacaoRelaxView> createState() => _MeditacaoRelaxViewState();
}

class _MeditacaoRelaxViewState extends State<MeditacaoRelaxView> {
  int? _selectedTimer; // 10, 20, 30 minutos
  bool _isPlaying = false;
  Timer? _autoStopTimer;

  String? _selectedSound;
  late AudioPlayer _player;

  final Map<String, String> soundFiles = {
    "Vento": "lib/assets/music/nevasca_vento.mp3",
    "Harpa": "lib/assets/music/harpa.mp3",
    "Tigela": "lib/assets/music/tigela.mp3",
    "Piano": "lib/assets/music/piano.mp3",
    "Natureza": "lib/assets/music/natureza.mp3",
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
          album: "Relaxamento",
          title: _selectedSound!,
          artist: "App Serena",
        ),
      ),
    );

    // Loop infinito (até o timer mandar parar)
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

  Widget _buildSoundButton(String label, IconData icon) {
    final bool isSelected = _selectedSound == label;

    return ElevatedButton.icon(
      onPressed: () => setState(() => _selectedSound = label),
      icon: Icon(icon, color: isSelected ? Colors.white : Colors.black87),
      label: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFFABEE93) : Colors.grey[200],
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Relaxamento'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Feche os olhos, respire fundo e permita-se relaxar profundamente...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const Text(
              "Escolha um som para relaxar:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _buildSoundButton("Vento", Icons.air),
                _buildSoundButton("Harpa", Icons.music_note),
                _buildSoundButton("Tigela", Icons.notifications),
                _buildSoundButton("Piano", Icons.piano),
                _buildSoundButton("Natureza", Icons.landscape),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Timer para desligar som automaticamente:",
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
              "Você merece esse momento de paz.",
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
