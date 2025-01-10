import 'package:eksiazeczka_kgp/resources/resources.dart';

enum Providers {
  google,
  apple;

  String get icon => switch (this) {
        Providers.google => ProvidersIcons.google,
        Providers.apple => ProvidersIcons.apple,
      };
}
