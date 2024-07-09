import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appState/appstate.dart';
import 'package:riverpod_tutorial/logic/provider/notifier_provider.dart';






// Stream Provider gib Appstate Objekte nach einander
// je Objeht wird nach x gebaut
//  Counter fängt mit 0 und endet beim 19
final counterStreamProvider = StreamProvider<AppState>(
  (ref) {
// nach der Situation in counterNotifierProvider kann das Stream-Verhalten sich ändern
// somit kann man das counterStreamProvider mittels counterNotifierProvider kontrollieren
    if (ref.watch(counterNotifierProvider).countUp!) {
      return Stream.periodic(
        const Duration(milliseconds: 300),
        ((counter) => AppState(number: counter)),
      ).take(20);
    } else {
      return Stream.periodic(
        const Duration(milliseconds: 300),
        ((counter) => AppState(number: 19 - counter)),
      ).take(20);
    }
  },
);

