part of analytic;

final eventManagerProvider = Provider<EventManager>((ref) {
  final eventManager = EventManager();

  ref.onDispose(() {
    eventManager.dispose();
  });

  return eventManager;
});

class EventManager {
  final _controller = StreamController<AnalyticEvent>.broadcast();

  Stream<AnalyticEvent> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }

  void onEvent(AnalyticEvent event) {
    _controller.sink.add(event);
  }
}
