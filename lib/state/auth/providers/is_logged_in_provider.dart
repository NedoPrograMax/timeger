import 'package:riverpod/riverpod.dart';
import 'package:time_managment_app/state/auth/providers/auth_provider.dart';

final isLoggedInProvider = Provider<bool>(
  (ref) => ref.watch(authProvider).isLoggedIn,
);
