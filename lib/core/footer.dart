import 'package:flutter/material.dart';

import '../core/routes.dart'; // Importa as rotas para navegação

class AppFooter extends StatelessWidget {
  final int currentIndex;

  const AppFooter({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.homeView);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.info);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.meditation);
        break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF7A48B), // Cor de fundo correta
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        backgroundColor: Colors.transparent, // Mantém transparente para o Material agir
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Informações'),
          BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Meditação'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificações'),
        ],
      ),
    );
  }

}
