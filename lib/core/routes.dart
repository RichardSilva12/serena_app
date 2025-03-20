import 'package:flutter/material.dart';

import '../views/home/home_page.dart';
import '../views/homeView/home_pricipal.dart';
//import '../views/meditation/meditation_page.dart';
//import '../views/breathing/breathing_page.dart';
//import '../views/sos/sos_page.dart';
//import '../views/quiz/quiz_page.dart';
//import '../views/info/info_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String homeView = '/homeView';
  static const String meditation = '/meditation';
  static const String breathing = '/breathing';
  static const String sos = '/sos';
  static const String quiz = '/quiz';
  static const String info = '/info';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    homeView: (context) => HomeView(),
    //meditation: (context) => MeditationPage(),
    //breathing: (context) => BreathingPage(),
    //sos: (context) => SosPage(),
    //quiz: (context) => QuizPage(),
    //info: (context) => InfoPage(),
  };
}
