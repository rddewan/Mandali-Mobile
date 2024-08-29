import 'package:common/common.dart';
import 'package:firebase_authentication/features/auth/firebase/domain/countries.dart';
import 'package:firebase_authentication/features/auth/firebase/presentation/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryPicker extends ConsumerStatefulWidget {
  final String countryCode;

  const CountryPicker({
    super.key,
    required this.countryCode,
  });

  @override
  ConsumerState createState() => _CountryPickerState();
}

class _CountryPickerState extends ConsumerState<CountryPicker> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(firebaseAuthControllerProvider.notifier).getCountryItem(
            widget.countryCode,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopupMenuButton<CountryCodeItem>(
          onSelected: (selected) {
            ref
                .read(firebaseAuthControllerProvider.notifier)
                .setCountryCode(selected);
          },
          itemBuilder: (context) {
            return countries.map((e) {
              return PopupMenuItem(
                value: e,
                child: Text('${e.name} (+${e.phoneCode})'),
              );
            }).toList();
          },
          child: Container(
            padding: const EdgeInsets.all(kMedium).copyWith(left: 0),
            child: Row(
              children: [
                const Icon(Icons.arrow_drop_down),
                Consumer(
                  builder: (context, ref, child) {
                    final countryCode = ref.watch(
                      firebaseAuthControllerProvider
                          .select((value) => value.countryCode),
                    );
                    return Text(
                      countryCode,
                      style: const TextStyle(fontSize: kMedium),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
