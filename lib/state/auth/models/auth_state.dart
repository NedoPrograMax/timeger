class AuthState {
  String? userId;
  bool isLoading = false;

  get isLoggedIn => userId != null;

  AuthState.empty();

  AuthState({
    required this.isLoading,
    required this.userId,
  });

  AuthState copyWithIsLoading(bool isLoading) {
    return AuthState(
      isLoading: isLoading,
      userId: userId,
    );
  }
}
