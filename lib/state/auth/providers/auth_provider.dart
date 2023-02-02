import 'package:riverpod/riverpod.dart';
import 'package:time_managment_app/state/auth/models/auth_state.dart';
import 'package:time_managment_app/state/auth/notifiers/auth_notifier.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(AuthState.empty()),
);
