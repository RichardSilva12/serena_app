import 'package:flutter/material.dart';

class RespiracaoPersonalizadaView extends StatefulWidget {
  const RespiracaoPersonalizadaView({super.key});

  @override
  State<RespiracaoPersonalizadaView> createState() => _RespiracaoPersonalizadaViewState();
}

class _RespiracaoPersonalizadaViewState extends State<RespiracaoPersonalizadaView> {
  final TextEditingController inspirarController = TextEditingController();
  final TextEditingController segurarController = TextEditingController();
  final TextEditingController expirarController = TextEditingController();

  @override
  void dispose() {
    inspirarController.dispose();
    segurarController.dispose();
    expirarController.dispose();
    super.dispose();
  }

  void _iniciarSessao() {
    final int inspirar = int.tryParse(inspirarController.text) ?? 4;
    final int segurar = int.tryParse(segurarController.text) ?? 4;
    final int expirar = int.tryParse(expirarController.text) ?? 4;

    Navigator.pushNamed(
      context,
      '/sessao-respiracao',
      arguments: {
        'inspirar': inspirar,
        'segurar': segurar,
        'expirar': expirar,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text('Respiração Personalizada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildTextField(inspirarController, 'Tempo para Inspirar (segundos)'),
            const SizedBox(height: 16),
            _buildTextField(segurarController, 'Tempo para Segurar (segundos)'),
            const SizedBox(height: 16),
            _buildTextField(expirarController, 'Tempo para Expirar (segundos)'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _iniciarSessao,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFABEE93),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Iniciar Sessão',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
