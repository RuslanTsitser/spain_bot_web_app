import 'package:firebase_core/firebase_core.dart';
import 'package:spain_bot_web_app/core/services/base_init_service.dart';
import 'package:spain_bot_web_app/firebase_options.dart';

abstract class FirebaseService implements BaseInitService {}

class FirebaseServiceImpl implements FirebaseService {
  @override
  Future<void> init() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
