part of common;

class AppScaffoldScrollable extends StatelessWidget {
  final Widget? title;
  final Widget widget;
  final bool centerTitle;
  final ScrollController? controller;
  final Widget? bottomNavigationBar;

  const AppScaffoldScrollable({
    super.key,
    this.title,
    required this.widget,
    this.centerTitle = true,
    this.controller,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations('appName'),
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: widget,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
