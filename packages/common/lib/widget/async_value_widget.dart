part of common;

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool showLoading;
  final bool showError;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.showLoading = true,
    this.showError = true,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (error, stackTrace) {
        final failure = error as Failure;
        return showError
            ? Center(
                child: Text(failure.message),
              )
            : const SizedBox.shrink();
      },
      loading: () {
        return showLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
