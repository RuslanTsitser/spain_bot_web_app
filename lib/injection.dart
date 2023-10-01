import 'package:flutter/material.dart';
import 'package:spain_bot_web_app/core/services/firebase_service/auth_service.dart';
import 'package:spain_bot_web_app/core/services/firebase_service/firebase_service.dart';
import 'package:spain_bot_web_app/core/services/firebase_service/firestore_service.dart';
import 'package:spain_bot_web_app/core/services/telegram_service/telegram_service.dart';
import 'package:spain_bot_web_app/core/services/url_launcher_service/url_launcher_service.dart';

class InjectionServiceWidget extends InheritedWidget {
  final FirebaseService firebaseService;
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;
  final TelegramService telegramService;
  final UrlLauncherService urlLauncherService;
  const InjectionServiceWidget({
    super.key,
    required this.firebaseService,
    required this.firebaseAuthService,
    required this.firestoreService,
    required this.telegramService,
    required this.urlLauncherService,
    required super.child,
  });

  Future<void> initServices() async {
    await firebaseService.init();
    await firebaseAuthService.init();
  }

  static InjectionServiceWidget of(BuildContext context, {bool listen = false}) => listen
      ? context.dependOnInheritedWidgetOfExactType<InjectionServiceWidget>()!
      : context.findAncestorWidgetOfExactType<InjectionServiceWidget>()!;

  @override
  bool updateShouldNotify(InjectionServiceWidget oldWidget) => true;
}
