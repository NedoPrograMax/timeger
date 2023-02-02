import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time_managment_app/state/auth/providers/auth_provider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
           AppBar(
            title: Text("Main Drawer!"),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text("Logout"),
            onTap: () => ref.read(authProvider.notifier).logOut(),
          ),
        ],
      ),
    );
  }
}
