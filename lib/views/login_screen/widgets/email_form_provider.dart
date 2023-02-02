import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/inputed_values_provider.dart';
import 'auth_form.dart';

class EmailFormField extends ConsumerWidget {
  const EmailFormField({
    Key? key,
    required this.usernameFocusNode,
    required this.passwordFocusNode,
    required this.authType,
    required this.height,
  }) : super(key: key);

  final FocusNode usernameFocusNode;
  final FocusNode passwordFocusNode;
  final AuthType authType;
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: height,
        child: TextFormField(
          key: const ValueKey("email"),
          initialValue: ref.read(inputedValuesProvider).email,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(labelText: "Email address"),
          validator: (value) {
            if (value == null) {
              return "Please provide an email";
            }
            if (value.contains('@') &&
                value.contains('.') &&
                value.length >= 5) {
              return null;
            } else {
              return "Please provide a valid email";
            }
          },
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
              authType == AuthType.SignUp
                  ? usernameFocusNode
                  : passwordFocusNode),
          onSaved: (value) =>
              ref.read(inputedValuesProvider).email = value ?? "",
        ));
  }
}
