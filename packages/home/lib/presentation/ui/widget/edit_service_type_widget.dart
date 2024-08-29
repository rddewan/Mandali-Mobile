part of home;

class EditServiceTypeWidget extends ConsumerWidget {
  final TextEditingController churchServiceTypeController;
  final void Function(ChurchServiceType?)? onSelected;

  const EditServiceTypeWidget({
    super.key,
    required this.churchServiceTypeController,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serviceType = ref.watch(
      homeControllerProvider
          .select((value) => value.updateFormState['serviceType']),
    );

    return DropdownButtonFormField<ChurchServiceType>(
      value: serviceType,
      hint: Text(context.localizations('home.serviceType')),
      onChanged: onSelected,
      validator: (value) {
        if (value == null) {
          return context.localizations('home.selectServiceType');
        }
        return null;
      },
      items: ChurchServiceType.values.map((ChurchServiceType value) {
        return DropdownMenuItem<ChurchServiceType>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kSmall), // Adjust as needed
        ),
      ),
    );
  }
}
