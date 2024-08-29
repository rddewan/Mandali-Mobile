import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonWidget extends ConsumerWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      firebaseAuthControllerProvider.select((value) => value.isLoading),
    );
    return PrimaryButton(
      text: text,
      padding: const EdgeInsets.symmetric(
        horizontal: kXXXLarge,
        vertical: kMedium,
      ),
      isEnabled: isLoading ? false : true,
      isLoading: isLoading,
      //fixedSize: const Size(250, 68),
      onPressed: onPressed,
    );
  }
}
