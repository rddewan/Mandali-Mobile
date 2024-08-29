part of account;

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen>
    with ConfirmDialogMixin, SuccessDialogMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(accountControllerProvider.notifier).me();
    });
  }

  @override
  Widget build(BuildContext context) {
    _listener();

    return MainAppScaffold(
      actions: [
        MenuAnchor(
          menuChildren: [
            MenuItemButton(
              onPressed: _signOut,
              child: Text(context.localizations('account.signOut')),
            ),
            MenuItemButton(
              onPressed: _deleteMe,
              child: Text(context.localizations('account.deleteMyAccount')),
            ),
          ],
          builder: (context, controller, child) {
            return IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
            );
          },
        ),
      ],
      widget: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileWidget(),
        ],
      ),
    );
  }

  void _signOut() {
    ref.invalidate(scrollControllerProvider);
    ref.read(accountControllerProvider.notifier).signOut();
  }

  void _deleteMe() {
    showConfirmDialog(
      context: context,
      title: context.localizations('account.deleteDialogTitle'),
      msg: context.localizations('account.deleteDialogSubTitle'),
      btnYesText: context.localizations('account.btnYes'),
      btnNoText: context.localizations('account.btnNo'),
      icon: const Icon(
        Icons.warning_outlined,
        color: Colors.red,
      ),
      onYesTap: () {
        // delete customer account
        ref.read(accountControllerProvider.notifier).deleteMe();
        // close dialog
        context.pop();
      },
      onNoTap: () {
        // close dialog
        context.pop();
      },
    );
  }

  void _listener() {
    // loading state
    ref.listen(accountControllerProvider.select((value) => value.isLoading),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
    // delete account loading
    ref.listen(accountControllerProvider.select((value) => value.isDeleteting),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
    // update account loading
    ref.listen(accountControllerProvider.select((value) => value.isUpdating),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
    //  signout loading
    ref.listen(accountControllerProvider.select((value) => value.isSigningOut),
        (_, next) {
      if (next) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    });
    // listen to token expired
    ref.listen(accountControllerProvider.select((value) => value.statusCode),
        (_, next) {
      // 498 = refresh token expired
      if (next != null && next == refreshTokenExpired) {
        context.go('/login');
      }
    });

    // sigout success
    ref.listen(accountControllerProvider.select((value) => value.isSignOut),
        (_, next) {
      if (next != null) {
        context.go('/login');
      }
    });

    // listen to error
    ref.listen(accountControllerProvider.select((value) => value.errorMsg),
        (_, next) {
      if (next != null) {
        showBaseToast(
          message: next,
          position: StyledToastPosition.bottom,
          toastType: ToastType.error,
        );
      }
    });

    // listen to delete account success
    ref.listen(accountControllerProvider.select((value) => value.isDeleteMe),
        (_, next) {
      if (next != null && next) {
        // show success dialog
        showSuccessDialog(
          context: context,
          barrierDismissible: false,
          title: context.localizations('account.deleteAccountSuccessTitle'),
          msg: context.localizations('account.deleteAccountSuccessMsg'),
          btnOkText: context.localizations('account.btnOk'),
          onOkTap: () async {
            await ref.read(accountControllerProvider.notifier).clearData();
            // invalidate the controller
            ref.invalidate(accountControllerProvider);

            // check if the state is still mounted
            if (!mounted) return;

            // close dialog
            context.pop();

            // go to main route
            context.go('/login');
          },
        );
      }
    });
  }
}
