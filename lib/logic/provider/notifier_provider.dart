import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appState/appstate.dart';
import 'package:riverpod_tutorial/logic/notifier/notifier.dart';
// Der bau von Notifier Provider ist sehr ähnlich von StateNotifierProvider 
// es braucht aber kein ref
final counterNotifierProvider = NotifierProvider<CounterNotifier, AppState>(() => CounterNotifier());
final counterNotifierProvider2 = NotifierProvider<CounterNotifier2, AppState2>(() => CounterNotifier2());