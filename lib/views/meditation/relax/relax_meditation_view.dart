import 'dart:async';

import 'package:flutter/material.dart';

class MeditacaoRelaxView extends StatefulWidget {
  const MeditacaoRelaxView({super.key});

  @override
  State<MeditacaoRelaxView> createState() => _MeditacaoRelaxViewState();
}

class _MeditacaoRelaxViewState extends State<MeditacaoRelaxView> {
  int? _selectedTimer;
  bool _isPlaying = false;
  Timer? _autoStopTimer;

  String? _selectedSound;

  void _selectTimer(int? minutes) {
    setState(() {
      _selectedTimer = minutes;
    });
  }

  void _selectSound(String soundName) {
    setState(() {
      _selectedSound = soundName;
    });
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    if (_isPlaying) {
      _startAutoStopTimer();
    } else {
      _stopTimer();
    }
  }

  void _reset() {
    _stopTimer();
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
    super.dispose();
  }

  Widget _buildSoundButton(String label, IconData icon) {
    final bool isSelected = _selectedSound == label;

    return ElevatedButton.icon(
      onPressed: () => _selectSound(label),
      icon: Icon(icon, color: isSelected ? Colors.white : Colors.black87),
      label: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black87),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFFABEE93) : Colors.grey[200],
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
                  label: const Text("Sem timer"),
                  selected: _selectedTimer == null,
                  onSelected: (_) => _selectTimer(null),
                ),
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
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, size: 40),
                  onPressed: _togglePlay,
                ),
                const SizedBox(width: 30),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 40),
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
}
