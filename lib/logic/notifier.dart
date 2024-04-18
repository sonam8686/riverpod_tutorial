import 'package:riverpod/riverpod.dart';
import 'package:riverpod_tutorial/logic/appstate.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState());

  // AppState build() => const AppState();
  void increment() {
    AppState newstate = state.copyWith(newName: 'Marten', married: false);
    newstate = newstate.incremnt();
    state = newstate;
    print(state.number);
  }

  void decrement() {
    AppState newstate = state;
    newstate = newstate.dencremnt();
    state = newstate;
    // state.number--;
    print(state.number);
  }
}

final numberProvider = StateProvider<AppState>((ref) {
  final next = ref.watch(counterProvider);
  final others = ref.watch(counter2Provider);
  final sum = next.number * others.number;
  return AppState(number: sum);
});

final counterProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) => AppStateNotifier());
final counter2Provider = NotifierProvider<CounterNotifier, AppState>(() => CounterNotifier());

class CounterNotifier extends Notifier<AppState> {
  CounterNotifier() : super();
  @override
  AppState build() => const AppState();
  void changeStatus(
    int? number, {
    String? name,
    bool? married,
  }) =>
      state = AppState(
        name: name,
        isMarried: married,
      );
  void increment() => state = const AppState().incremnt();
  void decrement() => state = const AppState().dencremnt();
}
