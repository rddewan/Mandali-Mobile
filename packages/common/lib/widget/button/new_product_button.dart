part of common;

class NewProductButton extends StatelessWidget {
  const NewProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kXLMedium,
      padding: const EdgeInsets.symmetric(horizontal: kXSmall),
      decoration: ShapeDecoration(
        color: const Color(0xFF29AEFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kXSmall),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.localizations('product.newChip'),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
