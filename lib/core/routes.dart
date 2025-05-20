import 'package:flutter/material.dart';

import '../views/breathing/personalizada_resp/personalizada_resp_view.dart';
import '../views/breathing/personalizada_resp/sessao_respiracao_view.dart';
import '../views/breathing/quadratica_resp/quadratica_resp_view.dart';
import '../views/breathing/rapida_resp/rapida_resp_view.dart';
import '../views/breathing/respiracao.dart';
import '../views/home/home_page.dart';
import '../views/homeView/home_pricipal.dart';
import '../views/info/autocuidado/autocuidao_view.dart';
import '../views/info/ferrementas_bas/ferram_prat_view.dart';
import '../views/info/home_info.dart';
import '../views/info/tecn_relaxamento/tecn_relax_view.dart';
import '../views/meditation/categories/category_meditation_view.dart';
import '../views/meditation/dicas/dicas_tela.dart';
import '../views/meditation/guided/guided_meditation_view.dart';
import '../views/meditation/home_meditation.dart';
import '../views/meditation/quick/quick_meditation_view.dart';
import '../views/meditation/relax/relax_meditation_view.dart';
import '../views/meditation/sono/sono_meditation_view.dart';
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
  static const String dicasMeditacao = '/dicasMeditacao';
  static const String guiaMeditacao = '/guiaMeditacao';
  static const String rapidaMeditacao = '/rapidaMeditacao';
  static const String categoriaMeditacao = '/categoriaMeditacao';
  static const String sonoMeditacao = '/sonoMeditacao';
  static const String relaxamentoMeditacao = '/relaxamentoMeditacao';
  static const String personalizadaResp = '/personalizadaResp';
  static const String quadraticaResp = '/quadraticaResp';
  static const String rapidaResp = '/rapidaResp';
  static const String infoFerramentas = '/infoFerramentas';
  static const String infoAutocuidado = '/infoAutocuidado';
  static const String infoRelaxamento = '/infoRelaxamento';
  static const String infoEducacao = '/infoEducacao';
  static const String sessaoResp = '/sessao-respiracao';

  

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    homeView: (context) => HomeView(),
    meditation: (context) => MeditationView(),
    breathing: (context) => RespiracaoView(),
    quiz: (context) => QuizIntroView(),
    quizQuestions: (context) => QuizQuestionsView(),
    info: (context) => InfoView(),
    dicasMeditacao: (context) => MeditacaoDicasView(),
    guiaMeditacao: (context) => MeditacaoGuiadaView(),
    rapidaMeditacao: (context) => MeditacaoQuickView(),
    categoriaMeditacao: (context) => MeditacaoCategoryView(),
    sonoMeditacao: (context) => MeditacaoSonoView(),
    relaxamentoMeditacao: (context) => MeditacaoRelaxView(),
    personalizadaResp: (constex) => RespiracaoPersonalizadaView(),
    quadraticaResp: (context) => RespiracaoQuadraticaView(),
    rapidaResp: (context) => RespiracaoRapidaView(),
    infoFerramentas: (context) => FerPraticaView(),
    infoAutocuidado: (context) => InfoAutoViewView(),
    infoRelaxamento: (context) => TencRelaxamentoView(),
    infoEducacao: (context) => InfoAutoViewView(),
    sessaoResp: (contest) => SessaoRespiracaoView(), 
  };
}
