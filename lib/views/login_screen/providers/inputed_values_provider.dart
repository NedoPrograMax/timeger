import 'package:riverpod/riverpod.dart';
import 'package:time_managment_app/views/login_screen/models/inputed_values.dart';

final inputedValuesProvider = Provider<InputedValues>(
  (ref) => InputedValues.empty(),
);
