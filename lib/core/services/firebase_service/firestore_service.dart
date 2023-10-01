import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spain_bot_web_app/core/utils/logging/app_logger.dart';

abstract class FirestoreService {
  Future<FirestoreData> getFirestoreData(String userId);
}

class FirestoreData {
  final bool isExpired;
  final String phpSessionId;
  final String url;
  const FirestoreData({
    required this.isExpired,
    required this.phpSessionId,
    required this.url,
  });
}

class FirestoreServiceImpl implements FirestoreService {
  @override
  Future<FirestoreData> getFirestoreData(String userId) async {
    try {
      final doc = await FirebaseFirestore.instance.collection('php_session_id').doc(userId).get();
      return FirestoreData(
        isExpired: doc['is_expired'] as bool,
        phpSessionId: doc['php_session_id'] as String,
        url: doc['url'] as String,
      );
    } catch (e, s) {
      logError(e, s);
      rethrow;
    }
  }
}
