part of common;

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final VoidCallback? onPressed;
  final FlexFit fit;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final double? paddingHorizontal;
  final Color? textColor;
  const PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.isEnabled = false,
    this.onPressed,
    this.fit = FlexFit.loose,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.padding,
    this.shape,
    this.paddingHorizontal,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? kMedium,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Flexible(
            flex: 1,
            fit: fit,
            child: FilledButton(
              style: FilledButton.styleFrom(
                padding: padding,
                shape: shape,
              ),
              onPressed: isEnabled ? onPressed : null,
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator.adaptive(),
                        const SizedBox(
                          width: kSmall,
                        ),
                        Text(
                          text,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
