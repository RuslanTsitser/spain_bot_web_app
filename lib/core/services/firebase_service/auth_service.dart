import 'package:firebase_auth/firebase_auth.dart';
import 'package:spain_bot_web_app/core/services/base_init_service.dart';
import 'package:spain_bot_web_app/core/utils/logging/app_logger.dart';

abstract class FirebaseAuthService implements BaseInitService {
  Future<void> signOut();
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  @override
  Future<void> init() async {
    final credentials = await FirebaseAuth.instance.signInAnonymously();
    logFirebase({
      'init': 'FirebaseAuthServiceImpl',
      'credentials': credentials.user?.uid,
    });
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    logFirebase('signOut');
  }
}
