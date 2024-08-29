part of common;

class ResponsiveCenterBox extends StatelessWidget {
  final double breakPoint;
  final Widget child;
  const ResponsiveCenterBox({
    super.key,
    this.breakPoint = BreakPoint.tablet,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: breakPoint,
        child: child,
      ),
    );
  }
}
