import 'package:spain_bot_web_app/core/services/firebase_service/firestore_service.dart';
import 'package:spain_bot_web_app/core/services/telegram_service/telegram_service.dart';
import 'package:spain_bot_web_app/core/services/url_launcher_service/url_launcher_service.dart';

abstract class BlsSpainRepository {
  Future<void> openLink();
}

class BlsSpainRepositoryImpl implements BlsSpainRepository {
  final TelegramService telegramService;
  final FirestoreService firestoreService;
  final UrlLauncherService urlLauncherService;

  BlsSpainRepositoryImpl({
    required this.telegramService,
    required this.firestoreService,
    required this.urlLauncherService,
  });

  @override
  Future<void> openLink() async {
    final userId = telegramService.userId;
    final data = await firestoreService.getFirestoreData(userId);
    return urlLauncherService.openBlsPage(data.url, data.phpSessionId);
  }
}
