import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/controller/firebase_auth_controller.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/widget/button_button.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/widget/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final GlobalKey<FormState> _formState = GlobalKey();
  final _countryCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  String isoCountryCode = 'IN';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    _countryCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _stateListener();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CountryPicker(
                    countryCode: isoCountryCode,
                  ),
                  Text(
                    'Phone Authentication',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Register account using your phone number.',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final selectedCountryCode = ref.watch(
                        firebaseAuthControllerProvider
                            .select((value) => value.selectedCountryCode),
                      );
                      _countryCodeController.text = selectedCountryCode;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: CustomTextFormField(
                              labelText: '',
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: _countryCodeController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a country';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Flexible(
                            flex: 3,
                            child: Form(
                              key: _formState,
                              child: CustomTextFormField(
                                labelText: '',
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                controller: _phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please input your phone number';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  ref
                                      .read(
                                        firebaseAuthControllerProvider.notifier,
                                      )
                                      .setPhoneNumber(value);

                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: kMedium),
                  ButtonWidget(text: 'Sign Up', onPressed: _signIn),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() {
    final isValid = _formState.currentState?.validate();
    if (isValid != null && isValid) {
      ref.read(firebaseAuthControllerProvider.notifier).signInWithPhone();
    }
  }

  void _stateListener() {
    ref.listen(
        firebaseAuthControllerProvider.select((value) => value.verificationId),
        (_, next) {
      if (next != null) {
        context.push(
          '/login/phoneOTP',
        );
      }
    });
    ref.listen(firebaseAuthControllerProvider.select((value) => value.errorMsg),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kMedium),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(kMedium),
              ),
            ),
            content: Text(next.toString()),
          ),
        );
      }
    });
  }
}
