import 'dart:async';

class DataRefreshService {
  final _controller = StreamController<dynamic>.broadcast();

  Stream<dynamic> get peaksUpdateStream async* {
    yield* _controller.stream;
  }

  void refresh() => _controller.add(null);
}
