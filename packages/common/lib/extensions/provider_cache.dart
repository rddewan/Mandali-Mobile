part of common;

extension AutoDisposeProviderBuilderCache on AutoDisposeProviderRef {
  void cacheFor(Duration duration) {
    // get the [KeepAliveLink]
    final keepAliveLink = keepAlive();
    // a timer to be used by the callbacks below
    Timer? timer;

    // When the provider is destroyed, cancel the http request and the timer
    onDispose(() {
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() {
      // start a duration timer
      timer = Timer(duration, () {
        // dispose on timeout
        keepAliveLink.close();
      });
    });
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}

extension AutoDisposeStateNotifierProviderCache
    on AutoDisposeStateNotifierProviderRef {
  void cacheFor(Duration duration) {
    // get the [KeepAliveLink]
    final keepAliveLink = keepAlive();
    // a timer to be used by the callbacks below
    Timer? timer;

    // When the provider is destroyed, cancel the http request and the timer
    onDispose(() {
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() {
      // start a 30 second timer
      timer = Timer(duration, () {
        // dispose on timeout
        keepAliveLink.close();
      });
    });
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}

extension AutoDisposeNotifierProviderCache on AutoDisposeNotifierProviderRef {
  void cacheFor(Duration duration) {
    // get the [KeepAliveLink]
    final keepAliveLink = keepAlive();
    // a timer to be used by the callbacks below
    Timer? timer;

    // When the provider is destroyed, cancel the http request and the timer
    onDispose(() {
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() {
      // start a duration timer
      timer = Timer(duration, () {
        // dispose on timeout
        keepAliveLink.close();
      });
    });
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}

extension AutoDisposeAsyncNotifierProviderCache
    on AutoDisposeAsyncNotifierProviderRef {
  void cacheFor(Duration duration) {
    // get the [KeepAliveLink]
    final keepAliveLink = keepAlive();
    // a timer to be used by the callbacks below
    Timer? timer;

    // When the provider is destroyed, cancel the http request and the timer
    onDispose(() {
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() {
      // start a duration timer
      timer = Timer(duration, () {
        // dispose on timeout
        keepAliveLink.close();
      });
    });
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}
