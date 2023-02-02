import 'dart:io';

class InputedValues {
  String email;
  String username;
  String password;
  File? userImage;

  InputedValues({
    required this.email,
    required this.username,
    required this.password,
    required this.userImage,
  });

  InputedValues.empty()
      : email = "",
        username = "",
        password = "",
        userImage = null;
}
