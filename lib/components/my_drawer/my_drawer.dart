import 'package:data_persistence/components/my_drawer/my_drawer_tile.dart';
import 'package:data_persistence/pages/orders_page.dart';
import 'package:data_persistence/pages/settings_page.dart';
import 'package:data_persistence/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            //APP LOGO
            Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            //HOME LIST TILES

            MyDrawerTile(
              text: "I N Í C I O",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            //CONFIGURACOES
            MyDrawerTile(
                text: "C O N F I G ",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                }),

            MyDrawerTile(
                text: "P E D I D O S ",
                icon: Icons.shopping_bag,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrdersPage(),
                    ),
                  );
                }),

            //LOGOUT

            MyDrawerTile(
                text: "S A I R", icon: Icons.logout, onTap: () => logout()),

            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
