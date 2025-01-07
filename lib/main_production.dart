import 'package:eksiazeczka_kgp/app.dart';
import 'package:eksiazeczka_kgp/bootstrap.dart';
import 'package:eksiazeczka_kgp/router/router.dart';

void main() {
  final router = AppRouter();
  bootstrap(() => App(router: router));
}
