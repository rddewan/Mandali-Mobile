part of common;

final scaleAnimation = TweenSequence([
  TweenSequenceItem(
    tween: Tween<double>(begin: 0.0, end: 3.0),
    weight: 50,
  ),
  TweenSequenceItem(
    tween: Tween<double>(begin: 3.0, end: 0.0),
    weight: 50,
  ),
]);
