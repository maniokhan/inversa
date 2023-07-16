// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/features/profile/presentation/screens/client_profile_screen.dart';
import 'package:inversaapp/src/features/home/presentation/screens/client_home_view.dart';
import 'package:inversaapp/src/features/store/presentation/screens/all_stores_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class ClientNavigationBar extends StatefulWidget {
  static Route<ClientNavigationBar> route() {
    return MaterialPageRoute(builder: (context) => const ClientNavigationBar());
  }

  const ClientNavigationBar({Key? key}) : super(key: key);

  @override
  State<ClientNavigationBar> createState() => _ClientNavigationBarState();
}

class _ClientNavigationBarState extends State<ClientNavigationBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const ClientHomeView(),
        const AllStoresScreen(),
        const ClientProfileScreen(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 6,
        height: 77,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.transparent,
        backgroundColor: ConfigColors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Assets.store.svg(),
            selectedIcon: Assets.store.svg(color: ConfigColors.primary2),
            label: 'Store',
          ),
          NavigationDestination(
            icon: Assets.clientPng.image(
              height: 26,
            ),
            selectedIcon: Assets.clientPng.image(
              height: 26,
              color: ConfigColors.primary2,
            ),
            label: 'Client',
          ),
          NavigationDestination(
            icon: Assets.person.svg(),
            label: 'Profile',
            selectedIcon: Assets.person.svg(color: ConfigColors.primary2),
          ),
        ],
      ),
    );
  }
}
