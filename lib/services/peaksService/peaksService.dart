import 'dart:async';

import 'package:eksiazeczka_kgp/data/models/models.dart';
import 'package:eksiazeczka_kgp/data/repositories/repositories.dart';
import 'package:eksiazeczka_kgp/services/authService/auth_service.dart';

class PeaksService {
  PeaksService(this._authService, this._supabasePeaksRepository) {
    initialize();
  }

  final AuthService _authService;
  final SupabasePeaksRepository _supabasePeaksRepository;

  List<Peak> peaksList = [];
  final _controller = StreamController<List<Peak>>.broadcast();

  Stream<List<Peak>> get peaks async* {
    yield* _controller.stream;
  }

  Future<void> initialize() async {
    final user = await _authService.getCurrentUser();
    final stream = await _supabasePeaksRepository.subscribe(userId: user.id);
    stream.listen((peaks) {
      peaksList = peaks;
      _controller.add(peaks);
    });
  }
}
