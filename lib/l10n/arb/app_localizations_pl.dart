// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get peaks => 'Szczyty';

  @override
  String get medals => 'Medale';

  @override
  String get more => 'Więcej';

  @override
  String get helloTraveler => 'Witaj podróżniku!';

  @override
  String get conqueredPeaks => 'Zdobyto ';

  @override
  String get conqueredPeaksOf => ' z ';

  @override
  String get peaksPageHeader => 'Jaki szczyt dzisiaj\nchcesz zdobyć?';

  @override
  String get all => 'Wszystkie';

  @override
  String get conquered => 'Zdobyte';

  @override
  String get unconquered => 'Niezdobyte';

  @override
  String get alphabetical => 'Alfabetycznie';

  @override
  String get heightAsc => 'Wysokość - od najniższej do najwyższej';

  @override
  String get heightDsc => 'Wysokość - od najwyższej do najniższej';

  @override
  String get conqueredDateAsc => 'Data zdobycia - od najstarszej do najnowszej';

  @override
  String get conqueredDateDsc => 'Data zdobycia - od najnowszej do najstarszej';

  @override
  String get easy => 'Łatwy';

  @override
  String get normal => 'Umiarkowany';

  @override
  String get hard => 'Trudny';

  @override
  String get low => 'Mała';

  @override
  String get medium => 'Średnia';

  @override
  String get high => 'Wysoka';

  @override
  String get masl => 'm n.p.m';

  @override
  String conqueredAt(String date) {
    return 'Zdobyto: $date';
  }

  @override
  String get emptyPeaksListAllTitle => 'Ups, coś jest nie tak...';

  @override
  String get emptyPeaksListAllDescription =>
      'Wygląda na to że nastąpił jakiś problem z danymi o szczytach.\nSpróbuj ponownie uruchomić aplikację.';

  @override
  String get emptyPeaksListConqueredTitle =>
      'Nie masz jeszcze zdobytych szczytów.';

  @override
  String get emptyPeaksListConqueredDescription =>
      'Twoja przygoda dopiero się zaczyna! Wyrusz na szlaki,\nzdobywaj szczyty i wróć tutaj, by wyświetlić zdobyte\nmiejsca.';

  @override
  String get emptyPeaksListUnconqueredTitle =>
      'Zdobyłeś już wszystkie szczyty!';

  @override
  String get emptyPeaksListUnconqueredDescription =>
      'Gratulacje, udało Ci się odwiedzić każdy szczyt.';

  @override
  String get signInCardTitle => 'Działasz w trybie Offline';

  @override
  String get signInCardDescription =>
      'Zaloguj się do aplikacji aby przechowywać swoje dane o zdobytych szczytach w chmurze!';

  @override
  String signInWith(String provider) {
    return 'Zaloguj się z $provider';
  }

  @override
  String get personalization => 'Personalizacja';

  @override
  String get darkMode => 'Tryb ciemny';

  @override
  String get appLanguage => 'Język aplikacji';

  @override
  String get account => 'Konto';

  @override
  String get menageAccount => 'Zarządzaj kontem';

  @override
  String get app => 'Aplikacja';

  @override
  String get addReview => 'Oceń aplikację w sklepie';

  @override
  String get helpAndConsents => 'Pomoc i zogdy';

  @override
  String get faq => 'FAQ';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get termsOfUse => 'Warunki użytkownia';

  @override
  String get light => 'Jasny';

  @override
  String get dark => 'Ciemny';

  @override
  String get system => 'Systemowy';

  @override
  String get polish => 'Polski';

  @override
  String get english => 'Angielski';

  @override
  String get general => 'Ogólne';

  @override
  String get howAppWorks => 'Działanie aplikacji';

  @override
  String get generalQuestion1 => 'Do czego służy aplikacja?';

  @override
  String get generalQuestion1Answer =>
      'Aplikacja służy jako elektroniczna książeczka do odznaczania zdobytych szczytów górskich. Dzięki niej możesz śledzić swoje postępy w zdobywaniu 28 szczytów polskich pasm górskich, tworząc swoją osobistą historię górskich osiągnięć.';

  @override
  String get generalQuestion2 => 'Jakie szczyty znajdują się w aplikacji?';

  @override
  String get generalQuestion2Answer =>
      'Aplikacja zawiera listę 28 szczytów polskich pasm górskich, które stanowią popularne wyzwanie dla miłośników turystyki górskiej.';

  @override
  String get generalQuestion3 => 'Gdzie mogę zgłosić problem lub nową funkcję?';

  @override
  String get generalQuestion3Answer =>
      'Problemy techniczne lub pomysły na nowe funkcje aplikacji możesz zgłaszać, wysyłając wiadomość na naszym Instagramie: @eksiazeczka.kp.';

  @override
  String get appFunctionalityQuestion1 => 'Jak działa odznaczanie szczytów?';

  @override
  String get appFunctionalityQuestion1Answer =>
      'Szczyt można odznaczyć za pomocą geolokalizacji. Jeśli znajdujesz się w promieniu 200 metrów od szczytu, aplikacja pozwoli Ci go oznaczyć jako zdobyty.';

  @override
  String get appFunctionalityQuestion2 => 'Gdzie zapisywane są zdjęcia?';

  @override
  String get appFunctionalityQuestion2Answer =>
      'Zdjęcia robione w aplikacji są zapisywane lokalnie na Twoim urządzeniu. Po usunięciu aplikacji wszystkie zapisane zdjęcia zostaną automatycznie usunięte.';

  @override
  String get appFunctionalityQuestion3 =>
      'Czy aplikacja zapisuje dane w chmurze?';

  @override
  String get appFunctionalityQuestion3Answer =>
      'Obecnie aplikacja działa w trybie offline. Pracujemy nad dodaniem funkcjonalności zapisywania danych w chmurze.';

  @override
  String get appFunctionalityQuestion4 =>
      'Co można robić po zebraniu wszystkich szczytów?';

  @override
  String get appFunctionalityQuestion4Answer =>
      'Na chwilę obecną po odznaczeniu wszystkich szczytów aplikacja nie oferuje dodatkowych funkcji. W przyszłości planujemy wprowadzić możliwość wielokrotnego odznaczania tych samych szczytów, co pozwoli na śledzenie powtórnych wejść.';

  @override
  String get information => 'Informacje';

  @override
  String get email => 'Adres email';

  @override
  String get accountCreatedAt => 'Data utworzenia';

  @override
  String get menage => 'Zarządzaj';

  @override
  String get deleteAccount => 'Usuń konto';

  @override
  String get signOut => 'Wyloguj się';

  @override
  String get signingIn => 'Logowanie...';

  @override
  String get deleteAccountConfirmationTitle => 'Czy jesteś pewien?';

  @override
  String get deleteAccountConfirmationDescription =>
      'Usunięcie konta sprawi usunięcie wszystkich danych powiązanych z twoim kontem, zarówno tych przechowywanych w chmurze jak i lokalnie. Operacji nie można cofnąć.';

  @override
  String get cancel => 'Anuluj';

  @override
  String get description => 'Opis';

  @override
  String get baseInformation => 'Podstawowe informacje';

  @override
  String get baseInformationSubtitle => 'Zapoznaj się z szczegółami o szczycie';

  @override
  String get markConquerPeak => 'Zaznacz zdobycie szczytu';

  @override
  String get youHaveConqueredPeak => 'Zdobyłeś szczyt!';

  @override
  String get youHaveConqueredPeakDescription =>
      'Gralujace! Zdobyłeś szczyt i możesz być z siebie\ndumny. Kolejny krok w Twojej górskiej przgodzie\nzaliczony - czas cieszyć się widokami i planować\nnastępne wyzwania!';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get addPhotoFromGallery => 'Dodaj z galerii';

  @override
  String get notInPeakRange => 'Nie jesteś wystarczająco blisko szczytu!';

  @override
  String get notInPeakRangeDescription =>
      'Wygląda na to, że nie znajdujesz się wystarczająco blisko szczytu,\naby zaznaczyć jego zdobycie. Upewnij się, że dotarłeś na miejsce\nzgodnie z wymaganiami – twoja lokalizacja musi pokrywać się z\nwyznaczoną strefą szczytu.';

  @override
  String get tryAgain => 'Spróbuj ponownie';

  @override
  String get buyPeak => 'Oznacz szczyt zdalnie za 20 zł';

  @override
  String get close => 'Zamknij';

  @override
  String get openSettings => 'Otwórz ustawienia';

  @override
  String get locationRationaleTitle => 'Uprawnienia do lokalizacji';

  @override
  String get locationRationaleDescription =>
      'Aplikacja potrzebuje dostępu do Twojej lokalizacji, aby zweryfikować, czy jesteś w pobliżu szczytu. Przejdź do ustawień aplikacji i zezwól na dostęp do lokalizacji.';

  @override
  String get cameraRationaleTitle => 'Uprawnienia do aparatu';

  @override
  String get cameraRationaleDescription =>
      'Aplikacja potrzebuje dostępu do Twojego aparatu, aby robić zdjęcia. Przejdź do ustawień aplikacji i zezwól na dostęp do aparatu.';

  @override
  String get photosRationaleTitle => 'Uprawnienia do zdjęć';

  @override
  String get photosRationaleDescription =>
      'Aplikacja potrzebuje dostępu do Twoich zdjęć, aby zapisać Twoje wyjątkowe wspomnienia. Przejdź do ustawień aplikacji i zezwól na dostęp do zdjęć.';

  @override
  String get photosOnboardingRationaleTitle => 'Uprawnienia do zdjęć';

  @override
  String get photosOnboardingRationaleDescription =>
      'Aplikacja potrzebuje dostępu do Twoich zdjęć, aby zweryfikować, że faktycznie zdobyłeś ten szczyt. Zdjęcie zostanie również zapisane jako pamiątkowe. Przejdź do ustawień aplikacji i zezwól na dostęp do zdjęć.';

  @override
  String get memorablePhoto => 'Pamiątkowe zdjęcie';

  @override
  String get memorablePhotoDescription =>
      'Twoje heroiczne zdobycie szczytu nie może obejść się bez zdjęcia.';

  @override
  String get medalsPageHeader => 'Każdy medal to\ndowód na twoje\nmistrzostwo!';

  @override
  String medalLabel(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        '1': 'Zdobądź pierwszy szczyt',
        '28': 'Zdobądź wszystkie szczyty',
        'other': 'Zdobądź łącznie: $count szczytów',
      },
    );
    return '$_temp0';
  }

  @override
  String medalTitle(String count) {
    String _temp0 = intl.Intl.selectLogic(
      count,
      {
        '1': 'Zdobyto pierwszy szczyt',
        '28': 'Zdobyto wszystkie szczyty',
        'other': 'Zdobyto $count szczytów',
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
            'Pierwszy krok w stronę przygody! Gratulacje za zdobycie swojego pierwszego szczytu!',
        '5':
            'Pięć razy na szczycie! Pokazujesz wytrwałość i pasję do górskich wędrówek.',
        '10':
            'Dziesięć zdobytych szczytów! Udowadniasz, że jesteś prawdziwym podróżnikiem.',
        '20': 'Dwadzieścia szczytów za Tobą – pokazujesz siłę charakteru.',
        '28':
            'Wszystkie szczyty zdobyte! Jesteś mistrzem górskiej przygody – czapki z głów!',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get memorablePhotoDialogTitle => 'Pamiątka ze szczytu';

  @override
  String get memorablePhotoDialogDescription =>
      'Zdobycie szczytu na pewno nie było proste ale udało Ci się! Wracaj wspominienami do tego dnia a może i pewnego dnia wróć zdobyć ponownie ten szczyt.';

  @override
  String get haveYouConqueredPeaksAlready =>
      'Czy zdobyłeś już jakiś szczyt bez użycia aplikacji?';

  @override
  String get haveYouConqueredPeaksAlreadyDescription =>
      'Możesz zaznaczyć już zdobyte szczyty tylko teraz. Każde oznaczenie wymaga zdjęcia z danego miejsca, które musi zawierać dane geolokalizacyjne. To zapewnia uczciwość i autentyczność oznaczeń.';

  @override
  String get goToApp => 'Przejdź do aplikacji';

  @override
  String version(String ver) {
    return 'eKsiążeczka - Korona Polski — wersja $ver';
  }

  @override
  String get attributions => 'Atrybucje';

  @override
  String get licenses => 'Licencje';

  @override
  String get followUsInstagram => 'Obserwuj nasz Instagram';
}
