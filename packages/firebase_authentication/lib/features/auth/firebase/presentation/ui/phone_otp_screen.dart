import 'package:common/common.dart';
import 'package:core/core.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class PhoneOTPScreen extends ConsumerStatefulWidget {
  const PhoneOTPScreen({super.key});

  @override
  ConsumerState<PhoneOTPScreen> createState() => _PhoneOTPScreenState();
}

class _PhoneOTPScreenState extends ConsumerState<PhoneOTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _stateListener();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Phone Verification',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    'Please input your OTP',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: kMedium),
                  Consumer(
                    builder: (context, ref, child) {
                      final smsCode = ref.watch(
                        firebaseAuthControllerProvider
                            .select((value) => value.smsCode),
                      );

                      _pinController.text = smsCode;

                      return Form(
                        key: _formKey,
                        child: Pinput(
                          length: 6,
                          controller: _pinController,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          validator: (value) {
                            if (value == null) {
                              return 'Pin is incorrect';
                            }
                            return null;
                          },
                          onCompleted: (value) {
                            ref
                                .read(firebaseAuthControllerProvider.notifier)
                                .onInputSmsCode(value);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: kMedium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _stateListener() {
    ref.listen(
        firebaseAuthControllerProvider.select((value) => value.isLoading),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });

    ref.listen(firebaseAuthControllerProvider.select((value) => value.userId),
        (_, next) {
      if (next != null) {
        // check if the use has already set the display name
        final displayName =
            ref.read(firebaseAuthProvider).currentUser?.displayName;
        if (displayName != null) {
          context.go('/');
        } else {
          context.go(
            '/login/updateName',
          );
        }
      }
    });

    ref.listen(
        firebaseAuthControllerProvider.select((value) => value.otpErrorMsg),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 30),
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
            action: SnackBarAction(
              label: context.localizations('auth.retry'),
              onPressed: () {
                _pinController.clear();
              },
            ),
          ),
        );
      }
    });
  }
}
