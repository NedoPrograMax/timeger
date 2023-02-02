import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_managment_app/views/login_screen/models/inputed_values.dart';
import 'package:time_managment_app/views/login_screen/providers/inputed_values_provider.dart';
import 'package:time_managment_app/views/login_screen/widgets/auth_type_choser.dart';

import 'email_form_provider.dart';
import 'password_form_provider.dart';
import 'user_image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'username_form_field.dart';

enum AuthType { Login, SignUp }

class AuthForm extends ConsumerStatefulWidget {
  const AuthForm(
    this._availableHeight,
    this.submitAuthForm, {
    super.key,
  });

  final double _availableHeight;
  final Future<void> Function(String email, String password, String username,
      File? image, bool isLogin, BuildContext context) submitAuthForm;

  @override
  ConsumerState<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends ConsumerState<AuthForm>
    with TickerProviderStateMixin {
  final _form = GlobalKey<FormState>();
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  var _authType = AuthType.Login;

  var _isInit = true;
  AnimationController? _controller;
  Animation<double>? _opacity;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
      _opacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Curves.linear,
        ),
      );
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _swithcAuthType() {
    if (_authType == AuthType.Login) {
      setState(() {
        _authType = AuthType.SignUp;
      });
      _controller!.forward();
    } else {
      setState(() {
        _authType = AuthType.Login;
      });
      _controller!.reverse();
    }
  }

  void _saveData() async {
    final inputedValues = ref.read(inputedValuesProvider);

    if (inputedValues.userImage == null && _authType == AuthType.SignUp) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Please pick an image"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }

    if (_form.currentState?.validate() == true) {
      _form.currentState?.save();

      await widget.submitAuthForm(
          inputedValues.email,
          inputedValues.password,
          inputedValues.username,
          inputedValues.userImage,
          _authType == AuthType.Login,
          context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
          vertical: widget._availableHeight * 0.01,
          horizontal: 10,
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
        height: _authType == AuthType.Login
            ? widget._availableHeight * 0.35
            : widget._availableHeight * 0.60,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UserImagePicker(
                  height: _authType != AuthType.Login
                      ? widget._availableHeight * 0.05
                      : 0,
                  opacity: _opacity!,
                ),
                EmailFormField(
                  height: widget._availableHeight * 0.1,
                  authType: _authType,
                  usernameFocusNode: _usernameFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                ),
                UsernameFormField(
                  height: _authType == AuthType.Login
                      ? 0
                      : widget._availableHeight * 0.1,
                  opacity: _opacity!,
                  usernameFocusNode: _usernameFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                  authType: _authType,
                ),
                PasswordFormField(
                  height: widget._availableHeight * 0.1,
                  authType: _authType,
                  usernameFocusNode: _usernameFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                  saveData: _saveData,
                ),
                SizedBox(
                  height: widget._availableHeight * 0.02,
                ),
                AuthTypeChoser(
                  height: widget._availableHeight * 0.05,
                  authType: _authType,
                  swithcAuthType: _swithcAuthType,
                  saveData: _saveData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
