import 'dart:async';

import 'package:flutter/material.dart';

class RespiracaoRapidaView extends StatefulWidget {
  const RespiracaoRapidaView({super.key});

  @override
  State<RespiracaoRapidaView> createState() => _RespiracaoRapidaViewState();
}

class _RespiracaoRapidaViewState extends State<RespiracaoRapidaView> {
  late Timer _timer;
  int _remainingSeconds = 5 * 60;
  bool _isRunning = false;
  bool _isPaused = false;

  int _faseIndex = 0; // 0 = fase 3s, 1 = fase 4s, 2 = fase 5s
  int _etapaIndex = 0; // 0 = Inspire, 1 = Segure, 2 = Expire
  int _etapaTimeLeft = 0;
  String _faseTexto = 'Pronto para começar?';
  bool _emPausaEntreFases = false;
  int _pausaEntreFases = 5;

  final List<List<int>> _fases = [
    [3, 3, 3],
    [4, 4, 4],
    [5, 5, 5],
  ];
  final List<String> _etapas = ['Inspire', 'Segure', 'Expire'];

  void _startTimer() {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _isPaused = false;
      _etapaTimeLeft = _fases[_faseIndex][_etapaIndex];
      _faseTexto = _etapas[_etapaIndex];
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isPaused) return;

      setState(() {
        if (_remainingSeconds <= 0) {
          _faseTexto = 'Prática concluída!';
          _timer.cancel();
          _isRunning = false;
          return;
        }

        _remainingSeconds--;

        if (_emPausaEntreFases) {
          _pausaEntreFases--;
          _faseTexto = 'Pausa...';

          if (_pausaEntreFases <= 0) {
            _emPausaEntreFases = false;
            _etapaIndex = 0;
            _etapaTimeLeft = _fases[_faseIndex][_etapaIndex];
            _faseTexto = _etapas[_etapaIndex];
          }

          return;
        }

        _etapaTimeLeft--;

        if (_etapaTimeLeft <= 0) {
          _etapaIndex++;

          if (_etapaIndex >= 3) {
            // Final da fase, ir para pausa de 5s antes da próxima
            _faseIndex++;
            if (_faseIndex >= _fases.length) {
              _faseIndex = 0; // reinicia ciclo de fases
            }
            _etapaIndex = 0;
            _emPausaEntreFases = true;
            _pausaEntreFases = 5;
            _faseTexto = 'Pausa...';
          } else {
            // Avança para próxima etapa da fase
            _etapaTimeLeft = _fases[_faseIndex][_etapaIndex];
            _faseTexto = _etapas[_etapaIndex];
          }
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _resetTimer() {
    if (_timer.isActive) _timer.cancel();

    setState(() {
      _remainingSeconds = 5 * 60;
      _faseTexto = 'Pronto para começar?';
      _faseIndex = 0;
      _etapaIndex = 0;
      _etapaTimeLeft = 0;
      _emPausaEntreFases = false;
      _pausaEntreFases = 5;
      _isRunning = false;
      _isPaused = false;
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    if (_timer.isActive) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Respiração Rápida'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _resetTimer();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _faseTexto,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 237, 54, 17),
                ),
                child: Text(
                  _formatTime(_remainingSeconds),
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _isRunning ? _pauseTimer : _startTimer,
                    icon: Icon(_isRunning ? (_isPaused ? Icons.play_arrow : Icons.pause) : Icons.play_arrow),
                    label: Text(_isRunning ? (_isPaused ? 'Retomar' : 'Pausar') : 'Iniciar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFABEE93),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: _resetTimer,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reiniciar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
