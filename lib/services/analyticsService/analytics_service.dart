import 'package:eksiazeczka_kp/data/constants.dart';
import 'package:eksiazeczka_kp/data/enums/enums.dart';
import 'package:eksiazeczka_kp/services/analyticsService/analytic_events.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lukehog/lukehog.dart';

class AnalyticsService {
  final _instance = Lukehog(lukehogApiKey);

  void _capture({required AnalyticsEvents event, Map<String, dynamic>? properties}) {
    _instance.capture(event.name, properties: {...?properties});
  }

  void onPeaksOnboardingCompleted(int peaksConqueredCount) {
    _capture(
      event: AnalyticsEvents.peaksOnboardingCompleted,
      properties: {'peaksConqueredCount': peaksConqueredCount},
    );
  }

  void onFilterTypeChanged(PeaksFilters filter) {
    _capture(
      event: AnalyticsEvents.peaksOnboardingCompleted,
      properties: {'filterType': filter.name},
    );
  }

  void onSortTypeChanged(PeaksSortTypes sortType) {
    _capture(
      event: AnalyticsEvents.peaksOnboardingCompleted,
      properties: {'sortType': sortType.name},
    );
  }

  void onConquerPeakFailed() {
    _capture(event: AnalyticsEvents.conquerPeakFailed);
  }

  void onConquerPeakSucceeded() {
    _capture(event: AnalyticsEvents.conquerPeakSucceeded);
  }

  void onConquerPeakSucceededPhotoAdded(ImageSource source) {
    _capture(
      event: AnalyticsEvents.conquerPeakSucceededPhotoAdded,
      properties: {'source': source.name},
    );
  }
}
