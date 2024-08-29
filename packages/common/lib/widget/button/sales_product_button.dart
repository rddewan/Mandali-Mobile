part of common;

class SalesProductButton extends StatelessWidget {
  final String text;
  const SalesProductButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kXLMedium,
      padding: const EdgeInsets.symmetric(horizontal: kXSmall),
      decoration: ShapeDecoration(
        color: const Color(0xFFE41D3D),
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
            text,
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
