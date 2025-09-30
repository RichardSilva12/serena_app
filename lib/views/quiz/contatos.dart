import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatosMedicosView extends StatelessWidget {
  const ContatosMedicosView({super.key});

  // Função para abrir telefone
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Não foi possível abrir o telefone $phoneNumber';
    }
  }

  // Função para abrir site
  Future<void> _launchSite(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o site $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFABEE93),
        title: const Text("Contatos Médicos"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Se você está passando por um momento difícil, não enfrente sozinho. "
            "Aqui estão alguns contatos de profissionais e instituições que podem ajudar:",
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 20),

          // Psiquiatra
          ListTile(
            leading: const Icon(Icons.local_hospital, color: Colors.green),
            title: const Text("Dr. João Silva - Psiquiatra"),
            subtitle: const Text("Telefone: (11) 99999-8888"),
            onTap: () => _launchPhone("11999998888"),
          ),

          // Psicóloga
          ListTile(
            leading: const Icon(Icons.psychology, color: Colors.blue),
            title: const Text("Dra. Maria Oliveira - Psicóloga"),
            subtitle: const Text("Telefone: (11) 98888-7777"),
            onTap: () => _launchPhone("11988887777"),
          ),

          // Site de busca profissional
          ListTile(
            leading: const Icon(Icons.public, color: Colors.purple),
            title: const Text("Buscar profissionais online"),
            subtitle: const Text("acesso: www.psicologosbrasil.com"),
            onTap: () => _launchSite("https://www.psicologosbrasil.com"),
          ),

          // CVV
          ListTile(
            leading: const Icon(Icons.support, color: Colors.red),
            title: const Text("CVV - Centro de Valorização da Vida"),
            subtitle: const Text("Telefone: 188 | Site: www.cvv.org.br"),
            onTap: () => _launchPhone("188"),
            onLongPress: () => _launchSite("https://www.cvv.org.br"),
          ),

          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Em casos de emergência, ligue para o SAMU - 192",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
