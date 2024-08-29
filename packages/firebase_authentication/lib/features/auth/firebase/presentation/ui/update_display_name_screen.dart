import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/controller/firebase_auth_controller.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/ui/widget/button_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UpDateDisplayName extends ConsumerStatefulWidget {
  const UpDateDisplayName({super.key});

  @override
  ConsumerState<UpDateDisplayName> createState() => _UpDateDisplayNameState();
}

class _UpDateDisplayNameState extends ConsumerState<UpDateDisplayName> {
  final GlobalKey<FormState> _formState = GlobalKey();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _stateListener();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What should we call you?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16.0),
              Form(
                key: _formState,
                child: CustomTextFormField(
                  labelText: '',
                  hintText: 'Display Name',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input your name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              ButtonWidget(text: 'Next', onPressed: _upDateDisplayName),
            ],
          ),
        ),
      ),
    );
  }

  void _upDateDisplayName() {
    final isValid = _formState.currentState?.validate();
    if (isValid != null && isValid) {
      ref.read(firebaseAuthControllerProvider.notifier).upDateDisplayName(
            _nameController.text.trimRight(),
          );
    }
  }

  /// Listens for changes in the state of the Firebase authentication controller.
  ///
  /// This function registers two listeners: one for the `isDisplayNameSet` property
  /// and another for the `errorMsg` property.
  ///
  /// When the `isDisplayNameSet` property becomes `true`, it navigates to the root
  /// screen using `context.push('/')`.
  ///
  /// When the `errorMsg` property is not null, it displays a snackbar with the error
  /// message using `ScaffoldMessenger.of(context).showSnackBar()`.
  ///
  /// This function does not take any parameters and does not return anything.
  void _stateListener() {
    ref.listen(
        firebaseAuthControllerProvider
            .select((value) => value.isDisplayNameSet), (_, next) {
      if (next) {
        ref.invalidate(firebaseAuthControllerProvider);
        context.push(
          '/',
        );
      }
    });
    ref.listen(firebaseAuthControllerProvider.select((value) => value.errorMsg),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.toString())),
        );
      }
    });
  }
}
