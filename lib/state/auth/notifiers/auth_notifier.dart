import 'package:riverpod/riverpod.dart';
import 'package:time_managment_app/state/auth/models/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(super.state);

  void signUp(
    String email,
    String password,
  ) async {
    state = state.copyWithIsLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    state = AuthState(
      isLoading: false,
      userId: "userId",
    );
  }

  void logIn(
    String email,
    String password,
  ) async {
    state = state.copyWithIsLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    state = AuthState(
      isLoading: false,
      userId: "userId",
    );
  }

  void logOut() async {
    state = state.copyWithIsLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    state = AuthState(
      isLoading: false,
      userId: null,
    );
  }
}
