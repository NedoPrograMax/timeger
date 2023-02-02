import 'package:flutter/material.dart';

import 'auth_form.dart';

class AuthTypeChoser extends StatelessWidget {
  const AuthTypeChoser({
    required this.height,
    required this.authType,
    required this.swithcAuthType,
    required this.saveData,
    super.key,
  });

  final double height;
  final AuthType authType;
  final VoidCallback swithcAuthType;
  final VoidCallback saveData;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: saveData,
          child: Text(authType.name),
        ),
      ),
      SizedBox(
        height: height,
        child: TextButton(
            onPressed: swithcAuthType,
            child: Text(authType == AuthType.Login
                ? "Create new account"
                : "Already have an account")),
      )
    ]);
  }
}
