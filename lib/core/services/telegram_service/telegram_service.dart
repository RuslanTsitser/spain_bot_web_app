import 'package:spain_bot_web_app/core/utils/logging/app_logger.dart';
import 'package:telegram_web_app_client/telegram_web_app_client.dart';

abstract class TelegramService {
  String get userId;
  String get name;
  void expand();
  void enableClosingConfirmation();
  void closeApp();
}

class TelegramServiceImpl implements TelegramService {
  @override
  void expand() {
    try {
      TeleWebApp().expand();
    } catch (e) {
      logInfo('expand Exception');
    }
  }

  @override
  String get name {
    try {
      return TeleWebApp().initDataUnsafe.user!.firstName!;
    } catch (e) {
      logInfo('name Exception');
      return 'test user web';
    }
  }

  @override
  String get userId {
    try {
      return TeleWebApp().initDataUnsafe.user?.id.toString() ?? '';
    } catch (e) {
      logInfo('userId Exception');
      return '747213289'; // 464090580 Veronika 747213289 Ruslan
    }
  }

  @override
  void enableClosingConfirmation() {
    try {
      TeleWebApp().enableClosingConfirmation();
    } catch (e) {
      logInfo('enableClosingConfirmation Exception');
    }
  }

  @override
  void closeApp() {
    try {
      TeleWebApp().close();
    } catch (e) {
      logInfo('closeApp Exception');
    }
  }
}
