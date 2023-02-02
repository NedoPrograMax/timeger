import 'package:riverpod/riverpod.dart';
import 'package:time_managment_app/state/auth/providers/auth_provider.dart';

final isLoadingProvider = Provider<bool>(
  (ref) => ref.watch(authProvider).isLoading,
);
