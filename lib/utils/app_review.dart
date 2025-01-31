import 'package:eksiazeczka_kp/data/constants.dart';
import 'package:in_app_review/in_app_review.dart';

class AppReview {
  static final _instance = InAppReview.instance;

  static Future<void> requestAppReview() async {
    final isAvailable = await _instance.isAvailable();
    if (isAvailable) await _instance.requestReview();
  }

  static Future<void> openStore() async {
    await _instance.openStoreListing(appStoreId: appStoreId);
  }
}
