part of common;

class OrderStatusWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String statusText;

  const OrderStatusWidget({
    required this.backgroundColor,
    required this.textColor,
    required this.statusText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 12,
          top: 12,
        ),
        child: Text(
          statusText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 0.12,
              ),
        ),
      ),
    );
  }
}
