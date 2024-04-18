import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appstate.dart';
import 'package:riverpod_tutorial/logic/notifier.dart';
import 'package:riverpod_tutorial/widgets/buttonState.dart';
import 'package:riverpod_tutorial/widgets/text_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) => Center(
            child: Text((ref.watch(numberProvider).toString())),
            // child: Text('Riverpod'),
          ),
        ),
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 5,
            child: TextState(),
          ),
          Expanded(
            child: ButtonState(),
          ),
        ],
      ),
    );
  }
}
