part of home;

class CreateChurchServiceScreen extends ConsumerStatefulWidget {
  const CreateChurchServiceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateChurchServiceScreenState();
}

class _CreateChurchServiceScreenState
    extends ConsumerState<CreateChurchServiceScreen> {
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
                const BibleReaderWidget(),
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
                ServiceTypeWidget(
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
                              .createChurchService();
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

  void _clearControllers() {
    _dateTimeController.clear();
    _chairPersonController.clear();
    _preacherController.clear();
    _offeringController.clear();
    _worshipController.clear();
    _churchServiceTypeController.clear();
  }

  void _setFormState(String key, dynamic value) {
    ref.read(homeControllerProvider.notifier).setFormState(
          key,
          value,
        );
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
    ref.listen(homeControllerProvider.select((value) => value.isLoading),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });

    ref.listen(homeControllerProvider.select((value) => value.statusCode),
        (_, next) {
      // 498 = refresh token expired
      if (next != null && next == refreshTokenExpired) {
        context.go('/login');
      }
    });

    ref.listen(homeControllerProvider.select((value) => value.isCreated),
        (_, next) {
      if (next != null && next) {
        showAdaptiveDialog(
          useRootNavigator: false,
          useSafeArea: true,
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: context.themeColor.primaryColor,
                  ),
                  const SizedBox(width: kSmall),
                  Text(context.localizations('home.success')),
                ],
              ),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.localizations('home.createSuccessMessage')),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    _clearControllers();
                    _onRefresh();
                    context.pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

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
