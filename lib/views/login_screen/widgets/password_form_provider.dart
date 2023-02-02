import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/inputed_values_provider.dart';
import 'auth_form.dart';

class PasswordFormField extends ConsumerWidget {
  const PasswordFormField(
      {Key? key,
      required this.usernameFocusNode,
      required this.passwordFocusNode,
      required this.authType,
      required this.saveData,
      required this.height,
      required})
      : super(key: key);

  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;
  final AuthType authType;
  final VoidCallback saveData;
  final double height;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return SizedBox(
        height: height,
        child: TextFormField(
          key: const ValueKey("password"),
          initialValue: ref.read(inputedValuesProvider).password,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password"),
          focusNode: passwordFocusNode,
          onFieldSubmitted: (value) {
            saveData();
          },
          validator: (value) {
            if (value == null) {
              return "Please provide a password";
            }
            if (value.length >= 6) {
              return null;
            } else {
              return "Please provide a long enough password (6 characters at least)";
            }
          },
          onSaved: (value) =>
              ref.read(inputedValuesProvider).password = value ?? "",
        ));
  }
}
