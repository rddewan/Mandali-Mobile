part of common;

class MainAppScaffold extends StatelessWidget {
  final Widget widget;
  final Widget? bottomNavigationBar;
  final ScrollController? controller;
  final VoidCallback? onClickLeading;
  final VoidCallback? onClickSearch;
  final VoidCallback? onClickCart;
  final List<Widget>? actions;

  const MainAppScaffold({
    super.key,
    required this.widget,
    this.onClickLeading,
    this.onClickSearch,
    this.onClickCart,
    this.controller,
    this.bottomNavigationBar,
    this.actions,
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
        actions: actions,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: widget,
        ),
      ),
      drawer: const MainAppDrawer(),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
