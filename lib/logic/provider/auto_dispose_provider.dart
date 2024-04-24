

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/logic/appState/appstate.dart';
import 'package:riverpod_tutorial/logic/notifier/state_notifier.dart';

// autoDispose: benutzt um das Provider zu deactivieren nach dem Schließen der Seite
final disposeProvider = StateNotifierProvider.autoDispose<AppStateNotifier, AppState>((ref) {
// Ohne ref.keepAlive(); wird die neue Wert der State nach der Diaktivierung entfernt 
// aber mit der kann man den neuen Wert beibehalten 
// so nur wenn ich will die neue State nach der deaktivierung behalten benutze ref.keepAlive();
  ref.keepAlive();
  return AppStateNotifier();
});