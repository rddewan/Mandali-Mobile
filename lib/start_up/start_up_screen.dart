import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mandali/start_up/provider/start_up_provider.dart';
import 'package:mandali/start_up/start_up_error.dart';
import 'package:mandali/start_up/start_up_loading.dart';

class StartUpScreen extends ConsumerWidget {
  final Flavor flavor;
  final WidgetBuilder builder;
  const StartUpScreen({
    super.key,
    required this.flavor,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startUp = ref.watch(startUpProvider(flavor: flavor));
    return startUp.when(
      data: (_) => builder(context),
      error: (error, stackTrace) {
        return StartUpError(
          error: error,
          stackTrace: stackTrace,
          retryAction: () => ref.invalidate(startUpProvider),
        );
      },
      loading: () => const StartUpLoading(),
    );
  }
}
