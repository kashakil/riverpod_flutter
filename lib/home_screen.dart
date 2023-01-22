import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void onSubmit(String value, WidgetRef ref) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(String value, WidgetRef ref) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(value, ref),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(value, ref),
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
    );
  }
}
