import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'core/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.serena.audio.channel',
    androidNotificationChannelName: 'Áudio Serena',
    androidNotificationOngoing: true,
  );

  runApp(const SerenaApp());
}

class SerenaApp extends StatelessWidget {
  const SerenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serena',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
