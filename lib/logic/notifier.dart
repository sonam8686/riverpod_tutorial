import 'dart:developer';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_tutorial/logic/appstate.dart';

// Um ein Provider bauen zu können muss Ein StateNotifier oder Notifier gebaut werden
// die State Notifier oder Notifier beinhaltet normalerweise die verlangte Funktionen
// <> ind diese Klammern wird die gezielte Klasse definiert
class AppStateNotifier extends StateNotifier<AppState> {
  // der Bau Der Notifier Klasse verlangt ein Super um die Eigenschaften der Mutter Klasse anzurufen
  AppStateNotifier() : super(const AppState());
// hie kommt die verlangten Funktionen
  void increment() {
    state = state.copyWith(number: state.number + 1);
    print(state.number);
  }

  void decrement() {
    state = state.copyWith(number: state.number - 1);
    print(state.number);
  }
}

//Notifier ist eine moderne verbesserte Vesion von StateNotifier und ist meistens damit empfählt
//weil es flexibler ist und bietet mehr Kontrolle über die Verwaltung von Zuständern
class CounterNotifier extends Notifier<AppState> {
  // Statt Konstraktor benutzt Notifier build methode
  @override
  // das default Value kann hier definiert werden
  AppState build() => const AppState(number: 10);
  // hie kommt die verlangten Funktionen
  void increment() {
    state = state.copyWith(number: state.number + 1);
    log(state.number.toString());
  }

  void decrement() {
    state = state.copyWith(number: state.number - 1);
    log(state.number.toString());
  }
}

class CounterNotifier2 extends Notifier<AppState2> {
  @override
  AppState2 build() => const AppState2();
  void increment() {
    state = state.copyWith(number: state.number + 1);
    print(state.number);
  }

  void decrement() {
    state = state.copyWith(number: state.number - 1);
    print(state.number);
  }
}

// diese kann nur int Wert zurück geben und verlangt keine klasse
// es kann nur mit einzelne Variabeln benutzt werden
class SingelNotifier extends StateNotifier<int> {
  SingelNotifier() : super(0);
  void increment() {
    state++;
    print(state);
  }

  void decrement() {
    state--;
    print(state);
  }
}
