// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get peaks => 'Peaks';

  @override
  String get medals => 'Medals';

  @override
  String get more => 'More';

  @override
  String get helloTraveler => 'Hello traveler!';

  @override
  String get conqueredPeaks => 'Conquered ';

  @override
  String get conqueredPeaksOf => ' of ';

  @override
  String get peaksPageHeader => 'What peak do you want\nto conquer today?';

  @override
  String get all => 'All';

  @override
  String get conquered => 'Conquered';

  @override
  String get unconquered => 'Unconquered';

  @override
  String get alphabetical => 'Alphabetically';

  @override
  String get heightAsc => 'Height - from lowest to highest';

  @override
  String get heightDsc => 'Height - from highest to lowest';

  @override
  String get conqueredDateAsc => 'Conquered date - from oldest to most recent';

  @override
  String get conqueredDateDsc => 'Conquered date - from most recent to oldest';

  @override
  String get easy => 'Easy';

  @override
  String get normal => 'Normal';

  @override
  String get hard => 'Hard';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get masl => 'm a.s.l';

  @override
  String conqueredAt(String date) {
    return 'Conquered at: $date';
  }

  @override
  String get emptyPeaksListAllTitle => 'Oops, something went wrong...';

  @override
  String get emptyPeaksListAllDescription =>
      'It seems there was an issue with the peak data. Try restarting the app.';

  @override
  String get emptyPeaksListConqueredTitle =>
      'You haven\'t conquered any peaks yet.';

  @override
  String get emptyPeaksListConqueredDescription =>
      'Your adventure is just beginning! Hit the trails, conquer peaks,\nand come back here to view your conquered places.';

  @override
  String get emptyPeaksListUnconqueredTitle =>
      'You\'ve conquered all the peaks!';

  @override
  String get emptyPeaksListUnconqueredDescription =>
      'Congratulations, you\'ve managed to visit every peak.';

  @override
  String get signInCardTitle => 'You\'re operating in Offline mode';

  @override
  String get signInCardDescription =>
      'Log in to the app to store your data in the cloud!';

  @override
  String signInWith(String provider) {
    return 'Sign in with $provider';
  }

  @override
  String get personalization => 'Personalization';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get appLanguage => 'Language';

  @override
  String get account => 'Account';

  @override
  String get menageAccount => 'Menage account';

  @override
  String get app => 'App';

  @override
  String get addReview => 'Add review in store';

  @override
  String get helpAndConsents => 'Help and consents';

  @override
  String get faq => 'FAQ';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get polish => 'Polish';

  @override
  String get english => 'English';

  @override
  String get general => 'General';

  @override
  String get howAppWorks => 'How app works';

  @override
  String get generalQuestion1 => 'What is the purpose of the app?';

  @override
  String get generalQuestion1Answer =>
      'The app serves as an electronic logbook for marking the mountain peaks you have conquered. It helps you track your progress in climbing 28 peaks across Polish mountain ranges, creating a personal record of your achievements.';

  @override
  String get generalQuestion2 => 'What peaks are included in the app?';

  @override
  String get generalQuestion2Answer =>
      'The app includes a list of 28 peaks across Polish mountain ranges, which is a popular challenge for mountain hiking enthusiasts.';

  @override
  String get generalQuestion3 =>
      'Where can I report a problem or suggest a new feature?';

  @override
  String get generalQuestion3Answer =>
      'You can report technical issues or suggest new features by sending a message to our Instagram account: @eksiazeczka.kp.';

  @override
  String get appFunctionalityQuestion1 => 'How does marking peaks work?';

  @override
  String get appFunctionalityQuestion1Answer =>
      'You can mark a peak using geolocation. If you are within 200 meters of the peak, the app will allow you to mark it as conquered.';

  @override
  String get appFunctionalityQuestion2 => 'Where are the photos saved?';

  @override
  String get appFunctionalityQuestion2Answer =>
      'Photos taken within the app are saved locally on your device. If you delete the app, all saved photos will be automatically removed.';

  @override
  String get appFunctionalityQuestion3 => 'Does the app save data in cloud?';

  @override
  String get appFunctionalityQuestion3Answer =>
      'Currently, the app works offline. We are working on adding this functionality, which may become available in future versions.';

  @override
  String get appFunctionalityQuestion4 =>
      'What happens after marking all peaks?';

  @override
  String get appFunctionalityQuestion4Answer =>
      'At this moment, the app doesn’t offer additional features after marking all peaks. In the future, we plan to add functionality that will allow you to mark the same peaks multiple times to track repeat climbs.';

  @override
  String get information => 'Information';

  @override
  String get email => 'Email address';

  @override
  String get accountCreatedAt => 'Created at';

  @override
  String get menage => 'Menage';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get signOut => 'Sign out';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get deleteAccountConfirmationTitle => 'Are you sure?';

  @override
  String get deleteAccountConfirmationDescription =>
      'Deleting your account will remove all data associated with your account, both stored in the cloud and locally. This operation cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get description => 'Description';

  @override
  String get baseInformation => 'Base information';

  @override
  String get baseInformationSubtitle => 'Read the details about the peak';

  @override
  String get markConquerPeak => 'Mark conquering the peak';

  @override
  String get youHaveConqueredPeak => 'You have conquered the peak!';

  @override
  String get youHaveConqueredPeakDescription =>
      'Congratulations! You\'ve reached the peak and can\nbe proud of yourself. Another step in your mountain\nadventure is complete – time to enjoy the views and plan the next challenges!';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get addPhotoFromGallery => 'Add from gallery';

  @override
  String get notInPeakRange => 'You are not close enough to the peak!';

  @override
  String get notInPeakRangeDescription =>
      'It seems that you are not close enough to the peak\nto mark it as conquered. Make sure you have reached the location\naccording to the requirements – your location must match the\ndesignated peak area.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get buyPeak => 'Unlock peak for 20 PLN';

  @override
  String get close => 'Close';

  @override
  String get openSettings => 'Open settings';

  @override
  String get locationRationaleTitle => 'Location permissions';

  @override
  String get locationRationaleDescription =>
      'The app needs access to your location to verify if you are near the peak. Go to the app settings and allow location access.';

  @override
  String get cameraRationaleTitle => 'Camera permissions';

  @override
  String get cameraRationaleDescription =>
      'The app needs access to your camera to capture photos. Go to the app settings and allow camera access.';

  @override
  String get photosRationaleTitle => 'Photos permissions';

  @override
  String get photosRationaleDescription =>
      'The app needs access to your photos to save your memorable photos. Go to the app settings and allow photo access.';

  @override
  String get photosOnboardingRationaleTitle => 'Photos permissions';

  @override
  String get photosOnboardingRationaleDescription =>
      'The app needs access to your photos to validate that you actually conquered that peak, also it will be saved as your memorable photo. Go to the app settings and allow photo access.';

  @override
  String get memorablePhoto => 'Memorable photo';

  @override
  String get memorablePhotoDescription =>
      'Your heroic peak conquest cannot go without a photo.';

  @override
  String get medalsPageHeader => 'Every medal is\na proof of your\nmastery!';

  @override
  String medalLabel(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        '1': 'Conquer your first peak',
        '28': 'Conquer all the peaks',
        'other': 'Conquer a total of: $count peaks',
      },
    );
    return '$_temp0';
  }

  @override
  String medalTitle(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        '1': 'First summit conquered',
        '28': 'All summits conquered',
        'other': 'Conquered $count summits',
      },
    );
    return '$_temp0';
  }

  @override
  String medalSubtitle(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        '1':
            'First step on your adventure! Congratulations on conquering your first summit!',
        '5':
            'Five summits conquered! You\'re showing perseverance and a passion for hiking.',
        '10':
            'Ten summits conquered! You\'re proving yourself to be a true mountaineer.',
        '20':
            'Twenty summits behind you – you\'re showing strength of character.',
        '28':
            'All summits conquered! You\'re a master of mountain adventure – hats off!',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get memorablePhotoDialogTitle => 'Peak souvenir';

  @override
  String get memorablePhotoDialogDescription =>
      'Reaching the peak was surely not easy, but you did it! Relive the memories of that day, and maybe one day return to conquer this peak again.';

  @override
  String get haveYouConqueredPeaksAlready =>
      'Have you already conquered any peaks without using the app?';

  @override
  String get haveYouConqueredPeaksAlreadyDescription =>
      'You can mark peaks you\'ve already conquered only now. Each marking requires a photo from the location, which must contain geolocation data. This ensures fairness and authenticity of the markings.';

  @override
  String get goToApp => 'Go to the app';

  @override
  String version(String ver) {
    return 'eKsiążeczka - Korona Polski — version $ver';
  }

  @override
  String get attributions => 'Attributions';

  @override
  String get licenses => 'Licenses';

  @override
  String get followUsInstagram => 'Follow us on Instagram';
}
