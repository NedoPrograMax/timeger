import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_managment_app/core/providers/is_loading_provider.dart';
import 'package:time_managment_app/core/providers/which_screen_provider.dart';
import 'package:time_managment_app/views/dialogs/loading/loading.dart';
import 'package:time_managment_app/views/login_screen/widgets/login_screen.dart';
import 'package:time_managment_app/views/main_screen/main_screen.dart';

import 'core/models/screens.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    ref.listen(isLoadingProvider, (previous, next) {
      if (next) {
        LoadingDialog.instance().show(context);
      } else {
        LoadingDialog.instance().hide();
      }
    });
    final screen = ref.watch(whichScreenProvider);
    switch (screen) {
      case Screens.login:
        return const AuthScreen();
       
      case Screens.main:
       return const MainScreen();
        
    }
  }
}
