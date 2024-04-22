import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appstate.dart';
import 'package:riverpod_tutorial/logic/notifier.dart';

// die Providers sind einfach Objekte von Notifier Klassen
// das Provider verlangt eine Notifier Klasse und die gezielte Klassse (AppState z.b.)
// duech das Provider Kann sowol die Appstate Attribute als auch die Notifier Funktionen aufgeruft werden
// Der bau von State Notifier Provider
final counterStateNotifierProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) => AppStateNotifier());
// dieses Provider kann nur ein Int Value repräsentieren
final singelCounterStateNotifierProvider = StateNotifierProvider<SingelNotifier, int>((ref) => SingelNotifier());
// ein State provider ist ähnlich von multi Providers
// es empfängt verschiedene providers und schafft damit die verlangte Funktion und gibt
//zurück die gezielte Objekt.
// Mit State Provider kan man auf Appstate verzichten und stattdessen verschiedene Singel Providers
//bauen, die die verlangte AppState bauen können
// die <Appstate> definiert das gebaute Objekt durch StateProvider
// es kann aber Providers von verschiedene Klasse in StateProvider erstellt werden (AppState2 z.b.)
final counterStateProvider = StateProvider<AppState>((ref) {
  final cSNP = ref.watch(counterStateNotifierProvider);
  final cNP = ref.watch(counterNotifierProvider);
  final sP = ref.watch(singelCounterStateNotifierProvider);
  final cNP2 = ref.watch(counterNotifierProvider2);
  final sum = cSNP.number + cNP.number + sP + cNP2.number;
  return AppState(number: sum);
});

// Der bau von Notifier Provider
final counterNotifierProvider = NotifierProvider<CounterNotifier, AppState>(() => CounterNotifier());
final counterNotifierProvider2 = NotifierProvider<CounterNotifier2, AppState2>(() => CounterNotifier2());
// hier wird die Future Provider gerbaut
final counterFutureProvider = FutureProvider<AppState>(
  (ref) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    // durch ref.watch(counterNotifierProvider) würde die verlangte Methoden geschafft
    // und die verlangte neu Appstate erstellt
    return ref.watch(counterNotifierProvider);
  },
);
