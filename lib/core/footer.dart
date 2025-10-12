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
      case 3:
        Navigator.pushNamed(context, AppRoutes.breathing);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Material(
        color: const Color(0xFFABEE93), // Cor de fundo
        elevation: 10, // dá um leve sombreamento para destacar o footer
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => _onItemTapped(context, index),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
          backgroundColor:const Color(0xFFABEE93), // mantém a cor consistente
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Informações'),
            BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Meditação'),
            BottomNavigationBarItem(icon: Icon(Icons.air), label: 'Respiração'),
          ],
        ),
      ),
    );
  }
}
