import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_managment_app/core/constants/strings.dart';
import 'package:time_managment_app/state/auth/providers/auth_provider.dart';
import 'package:time_managment_app/views/login_screen/widgets/app_title.dart';
import 'dart:io';

import 'auth_form.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  Future<void> _submitAuthForm(
    String email,
    String password,
    String username,
    File? image,
    bool isLogin,
    BuildContext context,
  ) async {
    if (isLogin) {
      ref.read(authProvider.notifier).logIn(
            email,
            password,
          );
    } else {
      ref.read(authProvider.notifier).signUp(
            email,
            password,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(title: const Text(auth));
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    return Scaffold(
      appBar: appBar,
      
      body: Container(
         decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade800,
              Colors.amber,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
        //    Flexible(child: Container()),
        //    Flexible(child: AppTitle()),
            Flexible(
              flex: 3,
              child: Center(
                child: AuthForm(
                  availableHeight,
                  _submitAuthForm,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
