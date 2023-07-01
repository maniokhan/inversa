// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:inversaapp/src/assets/assets.gen.dart';
import 'package:inversaapp/src/features/client/client_home_screen.dart';
import 'package:inversaapp/src/features/store/store_home_screen.dart';
import 'package:inversaapp/src/features/store/store_profile_screen.dart';
import 'package:inversaapp/src/theme/config_colors.dart';

class HomeScreen extends StatefulWidget {
  static Route<HomeScreen> route() {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const StoreHomeScreen(),
        const ClientHomeScreen(),
        const StoreProfileScreen(),
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
