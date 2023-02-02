import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_managment_app/core/models/screens.dart';
import 'package:time_managment_app/state/auth/providers/is_Logged_in_provider.dart';

final whichScreenProvider = StateProvider<Screens>(
  (ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    if(isLoggedIn){
      return Screens.main;
    }
    else{
      return Screens.login;
    }
  },
);
