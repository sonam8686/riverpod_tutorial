import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/providers.dart';

class TextNotifierProvider extends ConsumerWidget {
  const TextNotifierProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Der Bau von AppState Objekt der in Provider Scope benutzt ist und die State kontrollirt
    final appstate = ref.watch(counterNotifierProvider);
    return Center(
      child: Text(
        appstate.number.toString(),
        style: TextStyle(fontSize: 35),
      ),
    );
  }
}
