part of account;

class EditProfileWidget extends ConsumerStatefulWidget {
  const EditProfileWidget({super.key});

  @override
  ConsumerState<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends ConsumerState<EditProfileWidget> {
  final _key = GlobalKey<FormState>();
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMedium),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                context.localizations('account.editProfile'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: kMedium),
              CustomTextFormField(
                labelText: context.localizations('account.name'),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                controller: _nameController,
                onChanged: (value) {
                  final controller =
                      ref.read(accountControllerProvider.notifier);
                  controller.setUpdateMeFormData(
                    'name',
                    value.trimRight(),
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return context.localizations('account.pleaseInputYourName');
                  }
                  return null;
                },
              ),
              const SizedBox(height: kMedium),
              FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kXXLarge,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kMedium),
                  ),
                ),
                onPressed: _updateMe,
                child: Text(context.localizations('account.update')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateMe() {
    final isValid = _key.currentState?.validate() ?? false;
    if (isValid) {
      ref.read(accountControllerProvider.notifier).updateMe();
      Navigator.of(context).pop();
    }
  }
}
