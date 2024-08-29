part of home;

class EditChurchServiceScreen extends ConsumerStatefulWidget {
  final int id;
  const EditChurchServiceScreen({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditChurchServiceScreenState();
}

class _EditChurchServiceScreenState
    extends ConsumerState<EditChurchServiceScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _dateTimeController;
  late TextEditingController _chairPersonController;
  late TextEditingController _preacherController;
  late TextEditingController _offeringController;
  late TextEditingController _worshipController;
  late TextEditingController _churchServiceTypeController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(homeControllerProvider.notifier).setSelectedChurchService(
            widget.id,
          );
    });

    _dateTimeController = TextEditingController();
    _chairPersonController = TextEditingController();
    _preacherController = TextEditingController();
    _offeringController = TextEditingController();
    _worshipController = TextEditingController();
    _churchServiceTypeController = TextEditingController();
  }

  @override
  void dispose() {
    _dateTimeController.dispose();
    _chairPersonController.dispose();
    _preacherController.dispose();
    _offeringController.dispose();
    _worshipController.dispose();
    _churchServiceTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();
    final data = ref.watch(
      homeControllerProvider.select((value) => value.selectedChurchService),
    );

    _setControllersText(data);

    return AppScaffold(
      widget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kMedium),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  labelText: context.localizations('home.date'),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  controller: _dateTimeController,
                  readOnly: true,
                  onTap: () {
                    _dateTimePicker();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.localizations('home.selectDate');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: kMedium),
                CustomTextFormField(
                  labelText: context.localizations('home.chairPerson'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: _chairPersonController,
                  onChanged: (value) {
                    _setFormState("chairPerson", value.trimRight());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.localizations('home.inputChairPerson');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: kMedium),
                CustomTextFormField(
                  labelText: context.localizations('home.preacher'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: _preacherController,
                  onChanged: (value) {
                    _setFormState("preacher", value.trimRight());
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.localizations('home.inputPreacherName');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: kMedium),
                const EditBibleReaderWidget(),
                const SizedBox(height: kMedium),
                CustomTextFormField(
                  labelText: context.localizations('home.offering'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: _offeringController,
                  onChanged: (value) {
                    _setFormState("offering", value.trimRight());
                  },
                ),
                const SizedBox(height: kMedium),
                CustomTextFormField(
                  labelText: context.localizations('home.worship'),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: _worshipController,
                  onChanged: (value) {
                    _setFormState("worship", value.trimRight());
                  },
                ),
                const SizedBox(height: kMedium),
                EditServiceTypeWidget(
                  churchServiceTypeController: _churchServiceTypeController,
                  onSelected: (value) {
                    _setFormState("serviceType", value);
                  },
                ),
                const SizedBox(height: kLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kXLarge,
                          vertical: kSmall,
                        ),
                      ),
                      onPressed: () {
                        final isValid =
                            _formKey.currentState?.validate() ?? false;

                        if (isValid) {
                          ref
                              .read(homeControllerProvider.notifier)
                              .updateChurchService();
                        }
                      },
                      label: Text(context.localizations('home.save')),
                      icon: const Icon(Icons.save),
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

  void _setControllersText(ChurchService? data) {
    _chairPersonController.text = data?.chairPerson ?? '';
    _preacherController.text = data?.preacher ?? '';
    _offeringController.text = data?.offering ?? '';
    _worshipController.text = data?.worship ?? '';
    _churchServiceTypeController.text = data?.serviceType?.name ?? '';
    if (data?.date != null) {
      final dateFormat = ref.read(uiDateTimeProvider);
      DateTime dateTime = dateFormat.parse(
        data?.date ?? DateTime.now().toString(),
      );
      // time zone
      final timeZone = ref.read(timeZoneProvider.notifier).state;
      final location = tz.getLocation(timeZone);
      final tZDateTime = tz.TZDateTime.from(dateTime, location);
      // set date time controller
      _dateTimeController.text = tZDateTime.dateTimeToString;
    }
  }

  void _clearControllers() {
    _dateTimeController.clear();
    _chairPersonController.clear();
    _preacherController.clear();
    _offeringController.clear();
    _worshipController.clear();
    _churchServiceTypeController.clear();
  }

  void _setFormState(String key, dynamic value) {
    final controller = ref.read(homeControllerProvider.notifier);
    controller.setUpdateFormState(key, value);
  }

  void _dateTimePicker() {
    // date picker
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    ).then((date) {
      if (date != null && mounted) {
        // time picker
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((time) {
          final newTime = time ?? TimeOfDay.now();
          final dateTime = DateTime(
            date.year,
            date.month,
            date.day,
            newTime.hour,
            newTime.minute,
          );
          // time zone
          final timeZone = ref.read(timeZoneProvider.notifier).state;
          final location = tz.getLocation(timeZone);
          final tZDateTime = tz.TZDateTime.from(dateTime, location);
          // date format
          final formatter = ref.read(apiDateTimeProvider);
          String formatted = formatter.format(tZDateTime);
          // set form data
          _setFormState("date", formatted);
          // set date time controller
          _dateTimeController.text = tZDateTime.dateTimeToString;
        });
      }
    });
  }

  void _listener() {
    // loading state
    ref.listen(homeControllerProvider.select((value) => value.isUpdating),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });

    // 498 = refresh token expired
    ref.listen(homeControllerProvider.select((value) => value.statusCode),
        (_, next) {
      // 498 = refresh token expired
      if (next != null && next == refreshTokenExpired) {
        context.go('/login');
      }
    });

    // update success message
    ref.listen(homeControllerProvider.select((value) => value.isUpdated),
        (_, next) {
      if (next != null && next) {
        showBaseToast(
          message: context.localizations('home.updateSuccessMessage'),
          position: StyledToastPosition.bottom,
          toastType: ToastType.success,
        );
        _clearControllers();
        _onRefresh();
        context.pop();
      }
    });

    // error message
    ref.listen(homeControllerProvider.select((value) => value.errorMsg),
        (_, next) {
      if (next != null) {
        showBaseToast(
          message: next,
          position: StyledToastPosition.bottom,
          toastType: ToastType.error,
        );
      }
    });
  }

  Future<void> _onRefresh() async {
    final service = ref.read(homeControllerProvider.notifier);
    await service.onRefresh();
    service.getChurchServices();
  }
}
