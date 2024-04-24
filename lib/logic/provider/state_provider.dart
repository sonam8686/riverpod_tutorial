// ein State provider ist ähnlich von multi Providers
// es empfängt verschiedene providers und schafft damit die verlangte Funktion und gibt
//zurück die gezielte Objekt.
// Mit State Provider kan man auf Appstate verzichten und stattdessen verschiedene Singel Providers
//bauen, die die verlangte AppState bauen können
// die <Appstate> definiert das gebaute Objekt durch StateProvider
// es kann aber Providers von verschiedene Klasse in StateProvider erstellt werden (AppState2 z.b.)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appState/appstate.dart';
import 'package:riverpod_tutorial/logic/provider/notifier_provider.dart';
import 'package:riverpod_tutorial/logic/provider/state_notifier_provider.dart';

final counterStateProvider = StateProvider<AppState>((ref) {
  final cSNP = ref.watch(counterStateNotifierProvider);
  final cNP = ref.watch(counterNotifierProvider);
  final sP = ref.watch(singelCounterStateNotifierProvider);
  final cNP2 = ref.watch(counterNotifierProvider2);
  final sum = cSNP.number + cNP.number + sP + cNP2.number;
  return AppState(number: sum);
});