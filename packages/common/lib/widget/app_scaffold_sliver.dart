part of common;

class AppScaffoldSliver extends StatelessWidget {
  final List<Widget> slivers;
  final ScrollController? controller;
  final Widget? bottomNavigationBar;

  const AppScaffoldSliver({
    super.key,
    required this.slivers,
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
        child: CustomScrollView(
          controller: controller,
          slivers: slivers,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
