import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_pl.dart' deferred as app_localizations_pl;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl')
  ];

  /// No description provided for @peaks.
  ///
  /// In en, this message translates to:
  /// **'Peaks'**
  String get peaks;

  /// No description provided for @medals.
  ///
  /// In en, this message translates to:
  /// **'Medals'**
  String get medals;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @helloTraveler.
  ///
  /// In en, this message translates to:
  /// **'Hello traveler!'**
  String get helloTraveler;

  /// No description provided for @conqueredPeaks.
  ///
  /// In en, this message translates to:
  /// **'Conquered '**
  String get conqueredPeaks;

  /// No description provided for @conqueredPeaksOf.
  ///
  /// In en, this message translates to:
  /// **' of '**
  String get conqueredPeaksOf;

  /// No description provided for @peaksPageHeader.
  ///
  /// In en, this message translates to:
  /// **'What peak do you want\nto conquer today?'**
  String get peaksPageHeader;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @conquered.
  ///
  /// In en, this message translates to:
  /// **'Conquered'**
  String get conquered;

  /// No description provided for @unconquered.
  ///
  /// In en, this message translates to:
  /// **'Unconquered'**
  String get unconquered;

  /// No description provided for @alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetically'**
  String get alphabetical;

  /// No description provided for @heightAsc.
  ///
  /// In en, this message translates to:
  /// **'Height - from lowest to highest'**
  String get heightAsc;

  /// No description provided for @heightDsc.
  ///
  /// In en, this message translates to:
  /// **'Height - from highest to lowest'**
  String get heightDsc;

  /// No description provided for @conqueredDateAsc.
  ///
  /// In en, this message translates to:
  /// **'Conquered date - from oldest to most recent'**
  String get conqueredDateAsc;

  /// No description provided for @conqueredDateDsc.
  ///
  /// In en, this message translates to:
  /// **'Conquered date - from most recent to oldest'**
  String get conqueredDateDsc;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @masl.
  ///
  /// In en, this message translates to:
  /// **'m a.s.l'**
  String get masl;

  /// No description provided for @conqueredAt.
  ///
  /// In en, this message translates to:
  /// **'Conquered at: {date}'**
  String conqueredAt(String date);

  /// No description provided for @emptyPeaksListAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong...'**
  String get emptyPeaksListAllTitle;

  /// No description provided for @emptyPeaksListAllDescription.
  ///
  /// In en, this message translates to:
  /// **'It seems there was an issue with the peak data. Try restarting the app.'**
  String get emptyPeaksListAllDescription;

  /// No description provided for @emptyPeaksListConqueredTitle.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t conquered any peaks yet.'**
  String get emptyPeaksListConqueredTitle;

  /// No description provided for @emptyPeaksListConqueredDescription.
  ///
  /// In en, this message translates to:
  /// **'Your adventure is just beginning! Hit the trails, conquer peaks,\nand come back here to view your conquered places.'**
  String get emptyPeaksListConqueredDescription;

  /// No description provided for @emptyPeaksListUnconqueredTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'ve conquered all the peaks!'**
  String get emptyPeaksListUnconqueredTitle;

  /// No description provided for @emptyPeaksListUnconqueredDescription.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, you\'ve managed to visit every peak.'**
  String get emptyPeaksListUnconqueredDescription;

  /// No description provided for @signInCardTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re operating in Offline mode'**
  String get signInCardTitle;

  /// No description provided for @signInCardDescription.
  ///
  /// In en, this message translates to:
  /// **'Log in to the app to store your data in the cloud!'**
  String get signInCardDescription;

  /// No description provided for @signInWith.
  ///
  /// In en, this message translates to:
  /// **'Sign in with {provider}'**
  String signInWith(String provider);

  /// No description provided for @personalization.
  ///
  /// In en, this message translates to:
  /// **'Personalization'**
  String get personalization;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appLanguage;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @menageAccount.
  ///
  /// In en, this message translates to:
  /// **'Menage account'**
  String get menageAccount;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// No description provided for @addReview.
  ///
  /// In en, this message translates to:
  /// **'Add review in store'**
  String get addReview;

  /// No description provided for @helpAndConsents.
  ///
  /// In en, this message translates to:
  /// **'Help and consents'**
  String get helpAndConsents;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @polish.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get polish;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @howAppWorks.
  ///
  /// In en, this message translates to:
  /// **'How app works'**
  String get howAppWorks;

  /// No description provided for @generalQuestion1.
  ///
  /// In en, this message translates to:
  /// **'What is the purpose of the app?'**
  String get generalQuestion1;

  /// No description provided for @generalQuestion1Answer.
  ///
  /// In en, this message translates to:
  /// **'The app serves as an electronic logbook for marking the mountain peaks you have conquered. It helps you track your progress in climbing 28 peaks across Polish mountain ranges, creating a personal record of your achievements.'**
  String get generalQuestion1Answer;

  /// No description provided for @generalQuestion2.
  ///
  /// In en, this message translates to:
  /// **'What peaks are included in the app?'**
  String get generalQuestion2;

  /// No description provided for @generalQuestion2Answer.
  ///
  /// In en, this message translates to:
  /// **'The app includes a list of 28 peaks across Polish mountain ranges, which is a popular challenge for mountain hiking enthusiasts.'**
  String get generalQuestion2Answer;

  /// No description provided for @generalQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Where can I report a problem or suggest a new feature?'**
  String get generalQuestion3;

  /// No description provided for @generalQuestion3Answer.
  ///
  /// In en, this message translates to:
  /// **'You can report technical issues or suggest new features by sending a message to our Instagram account: @eksiazeczka.kp.'**
  String get generalQuestion3Answer;

  /// No description provided for @appFunctionalityQuestion1.
  ///
  /// In en, this message translates to:
  /// **'How does marking peaks work?'**
  String get appFunctionalityQuestion1;

  /// No description provided for @appFunctionalityQuestion1Answer.
  ///
  /// In en, this message translates to:
  /// **'You can mark a peak using geolocation. If you are within 200 meters of the peak, the app will allow you to mark it as conquered.'**
  String get appFunctionalityQuestion1Answer;

  /// No description provided for @appFunctionalityQuestion2.
  ///
  /// In en, this message translates to:
  /// **'Where are the photos saved?'**
  String get appFunctionalityQuestion2;

  /// No description provided for @appFunctionalityQuestion2Answer.
  ///
  /// In en, this message translates to:
  /// **'Photos taken within the app are saved locally on your device. If you delete the app, all saved photos will be automatically removed.'**
  String get appFunctionalityQuestion2Answer;

  /// No description provided for @appFunctionalityQuestion3.
  ///
  /// In en, this message translates to:
  /// **'Does the app save data in cloud?'**
  String get appFunctionalityQuestion3;

  /// No description provided for @appFunctionalityQuestion3Answer.
  ///
  /// In en, this message translates to:
  /// **'Currently, the app works offline. We are working on adding this functionality, which may become available in future versions.'**
  String get appFunctionalityQuestion3Answer;

  /// No description provided for @appFunctionalityQuestion4.
  ///
  /// In en, this message translates to:
  /// **'What happens after marking all peaks?'**
  String get appFunctionalityQuestion4;

  /// No description provided for @appFunctionalityQuestion4Answer.
  ///
  /// In en, this message translates to:
  /// **'At this moment, the app doesn’t offer additional features after marking all peaks. In the future, we plan to add functionality that will allow you to mark the same peaks multiple times to track repeat climbs.'**
  String get appFunctionalityQuestion4Answer;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get email;

  /// No description provided for @accountCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Created at'**
  String get accountCreatedAt;

  /// No description provided for @menage.
  ///
  /// In en, this message translates to:
  /// **'Menage'**
  String get menage;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signingIn.
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signingIn;

  /// No description provided for @deleteAccountConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get deleteAccountConfirmationTitle;

  /// No description provided for @deleteAccountConfirmationDescription.
  ///
  /// In en, this message translates to:
  /// **'Deleting your account will remove all data associated with your account, both stored in the cloud and locally. This operation cannot be undone.'**
  String get deleteAccountConfirmationDescription;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @baseInformation.
  ///
  /// In en, this message translates to:
  /// **'Base information'**
  String get baseInformation;

  /// No description provided for @baseInformationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Read the details about the peak'**
  String get baseInformationSubtitle;

  /// No description provided for @markConquerPeak.
  ///
  /// In en, this message translates to:
  /// **'Mark conquering the peak'**
  String get markConquerPeak;

  /// No description provided for @youHaveConqueredPeak.
  ///
  /// In en, this message translates to:
  /// **'You have conquered the peak!'**
  String get youHaveConqueredPeak;

  /// No description provided for @youHaveConqueredPeakDescription.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You\'ve reached the peak and can\nbe proud of yourself. Another step in your mountain\nadventure is complete – time to enjoy the views and plan the next challenges!'**
  String get youHaveConqueredPeakDescription;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take photo'**
  String get takePhoto;

  /// No description provided for @addPhotoFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Add from gallery'**
  String get addPhotoFromGallery;

  /// No description provided for @notInPeakRange.
  ///
  /// In en, this message translates to:
  /// **'You are not close enough to the peak!'**
  String get notInPeakRange;

  /// No description provided for @notInPeakRangeDescription.
  ///
  /// In en, this message translates to:
  /// **'It seems that you are not close enough to the peak\nto mark it as conquered. Make sure you have reached the location\naccording to the requirements – your location must match the\ndesignated peak area.'**
  String get notInPeakRangeDescription;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @buyPeak.
  ///
  /// In en, this message translates to:
  /// **'Unlock peak for 20 PLN'**
  String get buyPeak;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;

  /// No description provided for @locationRationaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Location permissions'**
  String get locationRationaleTitle;

  /// No description provided for @locationRationaleDescription.
  ///
  /// In en, this message translates to:
  /// **'The app needs access to your location to verify if you are near the peak. Go to the app settings and allow location access.'**
  String get locationRationaleDescription;

  /// No description provided for @cameraRationaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera permissions'**
  String get cameraRationaleTitle;

  /// No description provided for @cameraRationaleDescription.
  ///
  /// In en, this message translates to:
  /// **'The app needs access to your camera to capture photos. Go to the app settings and allow camera access.'**
  String get cameraRationaleDescription;

  /// No description provided for @photosRationaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Photos permissions'**
  String get photosRationaleTitle;

  /// No description provided for @photosRationaleDescription.
  ///
  /// In en, this message translates to:
  /// **'The app needs access to your photos to save your memorable photos. Go to the app settings and allow photo access.'**
  String get photosRationaleDescription;

  /// No description provided for @photosOnboardingRationaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Photos permissions'**
  String get photosOnboardingRationaleTitle;

  /// No description provided for @photosOnboardingRationaleDescription.
  ///
  /// In en, this message translates to:
  /// **'The app needs access to your photos to validate that you actually conquered that peak, also it will be saved as your memorable photo. Go to the app settings and allow photo access.'**
  String get photosOnboardingRationaleDescription;

  /// No description provided for @memorablePhoto.
  ///
  /// In en, this message translates to:
  /// **'Memorable photo'**
  String get memorablePhoto;

  /// No description provided for @memorablePhotoDescription.
  ///
  /// In en, this message translates to:
  /// **'Your heroic peak conquest cannot go without a photo.'**
  String get memorablePhotoDescription;

  /// No description provided for @medalsPageHeader.
  ///
  /// In en, this message translates to:
  /// **'Every medal is\na proof of your\nmastery!'**
  String get medalsPageHeader;

  /// No description provided for @medalLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, select, 1{Conquer your first peak} 28{Conquer all the peaks} other{Conquer a total of: {count} peaks}}'**
  String medalLabel(String count);

  /// No description provided for @medalTitle.
  ///
  /// In en, this message translates to:
  /// **'{count, select, 1{First summit conquered} 28{All summits conquered} other{Conquered {count} summits}}'**
  String medalTitle(String count);

  /// No description provided for @medalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count, select, 1{First step on your adventure! Congratulations on conquering your first summit!} 5{Five summits conquered! You\'re showing perseverance and a passion for hiking.} 10{Ten summits conquered! You\'re proving yourself to be a true mountaineer.} 20{Twenty summits behind you – you\'re showing strength of character.} 28{All summits conquered! You\'re a master of mountain adventure – hats off!} other{}}'**
  String medalSubtitle(String count);

  /// No description provided for @memorablePhotoDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Peak souvenir'**
  String get memorablePhotoDialogTitle;

  /// No description provided for @memorablePhotoDialogDescription.
  ///
  /// In en, this message translates to:
  /// **'Reaching the peak was surely not easy, but you did it! Relive the memories of that day, and maybe one day return to conquer this peak again.'**
  String get memorablePhotoDialogDescription;

  /// No description provided for @haveYouConqueredPeaksAlready.
  ///
  /// In en, this message translates to:
  /// **'Have you already conquered any peaks without using the app?'**
  String get haveYouConqueredPeaksAlready;

  /// No description provided for @haveYouConqueredPeaksAlreadyDescription.
  ///
  /// In en, this message translates to:
  /// **'You can mark peaks you\'ve already conquered only now. Each marking requires a photo from the location, which must contain geolocation data. This ensures fairness and authenticity of the markings.'**
  String get haveYouConqueredPeaksAlreadyDescription;

  /// No description provided for @goToApp.
  ///
  /// In en, this message translates to:
  /// **'Go to the app'**
  String get goToApp;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'eKsiążeczka - Korona Polski — version {ver}'**
  String version(String ver);

  /// No description provided for @attributions.
  ///
  /// In en, this message translates to:
  /// **'Attributions'**
  String get attributions;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @followUsInstagram.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Instagram'**
  String get followUsInstagram;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return app_localizations_en
          .loadLibrary()
          .then((dynamic _) => app_localizations_en.AppLocalizationsEn());
    case 'pl':
      return app_localizations_pl
          .loadLibrary()
          .then((dynamic _) => app_localizations_pl.AppLocalizationsPl());
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
