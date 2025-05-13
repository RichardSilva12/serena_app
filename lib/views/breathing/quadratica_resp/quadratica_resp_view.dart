import 'dart:async';

import 'package:flutter/material.dart';

class RespiracaoQuadraticaView extends StatefulWidget {
  const RespiracaoQuadraticaView({super.key});

  @override
  State<RespiracaoQuadraticaView> createState() => _RespiracaoQuadraticaViewState();
}

class _RespiracaoQuadraticaViewState extends State<RespiracaoQuadraticaView> {
  late Timer _timer;
  final int _totalSeconds = 3 * 60; // 3 minutos = 180 segundos
  int _remainingSeconds = 3 * 60; // 3 minutos = 180 segundos
  bool _isRunning = false;
  bool _isPaused = false;

  final List<String> _etapas = ['Inspire', 'Segure', 'Expire', 'Segure'];
  int _etapaIndex = 0;
  int _etapaTempoRestante = 4; // Tempo fixo de 4 segundos para cada etapa

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_isRunning && !_isPaused && _remainingSeconds > 0) {
        setState(() {
          _etapaTempoRestante--;
          _remainingSeconds--;

          if (_etapaTempoRestante == 0) {
            _etapaIndex = (_etapaIndex + 1) % _etapas.length;
            _etapaTempoRestante = 4; // Tempo fixo de 4 segundos para cada etapa
          }

          if (_remainingSeconds == 0) {
            _timer.cancel();
            _isRunning = false;
          }
        });
      }
    });
  }

  void _toggleStartPause() {
    setState(() {
      if (!_isRunning) {
        _isRunning = true;
        _isPaused = false;
        _startTimer();
      } else {
        _isPaused = !_isPaused;
      }
    });
  }

  void _reset() {
    setState(() {
      _timer.cancel();
      _remainingSeconds = _totalSeconds;
      _etapaIndex = 0;
      _etapaTempoRestante = 4;
      _isRunning = false;
      _isPaused = false;
    });
  }

  // Corrigindo a formatação do tempo
  String _formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60; // Dividir por 60 para obter os minutos
    final seconds = totalSeconds % 60; // O resto da divisão por 60 são os segundos
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Respiração Quadrática'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'A respiração quadrada é uma técnica de respiração que ajuda a reduzir o estresse e promover o relaxamento. '
              'Ela consiste em inspirar por 4 segundos, segurar por 4 segundos, expirar por 4 segundos e segurar novamente por 4 segundos.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            Text(
              _formatTime(_remainingSeconds), // Exibe 03:00 quando o tempo restante for 180 segundos
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              _etapas[_etapaIndex],
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _toggleStartPause,
                  icon: Icon(_isPaused || !_isRunning ? Icons.play_arrow : Icons.pause),
                  label: Text(_isPaused || !_isRunning ? 'Iniciar' : 'Pausar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFABEE93),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.replay),
                  label: const Text('Recomeçar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
