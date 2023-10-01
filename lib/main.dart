import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spain_bot_web_app/features/bls_spain/data/bls_spain_repository.dart';
import 'package:spain_bot_web_app/features/bls_spain/presentation/bls_page.dart';
import 'package:spain_bot_web_app/features/splash/error_page.dart';
import 'package:spain_bot_web_app/features/splash/splash_page.dart';
import 'package:spain_bot_web_app/injection.dart';

import 'core/services/export.dart';

void main() => runApp(
      InjectionServiceWidget(
        firebaseService: FirebaseServiceImpl(),
        firebaseAuthService: FirebaseAuthServiceImpl(),
        firestoreService: FirestoreServiceImpl(),
        telegramService: TelegramServiceImpl(),
        urlLauncherService: UrlLauncherServiceImpl(),
        child: const MainApp(),
      ),
    );

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<void> _future;

  @override
  void initState() {
    _future = InjectionServiceWidget.of(context).initServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          } else if (snapshot.hasError) {
            return const ErrorPage();
          }

          return Provider<BlsSpainRepository>(
            create: (context) => BlsSpainRepositoryImpl(
              firestoreService: InjectionServiceWidget.of(context).firestoreService,
              telegramService: InjectionServiceWidget.of(context).telegramService,
              urlLauncherService: InjectionServiceWidget.of(context).urlLauncherService,
            ),
            child: const BlsPage(),
          );
        },
      ),
    );
  }
}
