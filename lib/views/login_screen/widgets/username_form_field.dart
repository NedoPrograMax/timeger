import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/inputed_values_provider.dart';
import 'auth_form.dart';

class UsernameFormField extends ConsumerWidget {
  const UsernameFormField({
    Key? key,
    required this.usernameFocusNode,
    required this.passwordFocusNode,
    required this.authType,
    required this.height,
    required this.opacity,
  }) : super(key: key);

  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;
  final AuthType authType;
  final double height;
  final Animation<double> opacity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        height: height,
        child: FadeTransition(
            opacity: opacity,
            child: TextFormField(
              key: const ValueKey("username"),
              initialValue: ref.read(inputedValuesProvider).username,
              decoration: const InputDecoration(labelText: "Username"),
              focusNode: usernameFocusNode,
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(passwordFocusNode),
              validator: (value) {
                if (authType == AuthType.Login) {
                  return null;
                }
                if (value == null) {
                  return "Please provide a username";
                }
                if (value.length >= 4) {
                  return null;
                } else {
                  return "Please provide a long enough username (4 characters at least)";
                }
              },
              onSaved: (value) =>
                  ref.read(inputedValuesProvider).username = value ?? "",
            )));
  }
}
