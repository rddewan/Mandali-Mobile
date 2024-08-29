part of common;

class FlutterErrorWidget extends StatelessWidget {
  final FlutterErrorDetails error;
  const FlutterErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kMedium),
            child: Column(
              children: [
                const SizedBox(width: kSmall),
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                const SizedBox(width: kSmall),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Text(
                      error.exception.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
