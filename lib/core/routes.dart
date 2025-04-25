import 'package:flutter/material.dart';

import '../views/breathing/respiracao.dart';
import '../views/home/home_page.dart';
import '../views/homeView/home_pricipal.dart';
import '../views/info/home_info.dart';
import '../views/meditation/home_meditation.dart';
import '../views/quiz/home_quiz.dart';
import '../views/quiz/quiz_questions_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String homeView = '/homeView';
  static const String meditation = '/meditation';
  static const String breathing = '/breathing';
  static const String quiz = '/quiz';
  static const String info = '/info';
  static const String quizQuestions = '/quizQuestions';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    homeView: (context) => HomeView(),
    meditation: (context) => MeditationView(),
    breathing: (context) => RespiracaoView(),
    quiz: (context) => QuizIntroView(),
    quizQuestions: (context) => QuizQuestionsView(),
    info: (context) => InfoView(),
  };
}
