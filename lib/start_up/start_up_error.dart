import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartUpError extends ConsumerWidget {
  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback? retryAction;
  const StartUpError({
    super.key,
    required this.error,
    this.stackTrace,
    this.retryAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kMedium),
              child: Column(
                children: [
                  Text(error.toString()),
                  const SizedBox(height: 8),
                  if (retryAction != null) ...[
                    FilledButton(
                      onPressed: retryAction,
                      child: const Text('Retry'),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
