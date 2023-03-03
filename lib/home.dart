import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_starter/routes.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          StoresRoute(),
          ShipmentRoute(),
          ProfileRoute(),
        ],
      bottomNavigationBuilder: (_, tabsRouter){
          return Material(
            elevation: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).bottomAppBarColor,
                boxShadow: const [
                  BoxShadow(color: Color(0x10000000), blurRadius: 5)
                ]
              ),
              child: SalomonBottomBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                selectedItemColor: Theme.of(context).colorScheme.secondary,
                items: [
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.store),
                      title: Text(AppLocalizations.of(context)!.store)),
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.local_shipping),
                      title: Text(AppLocalizations.of(context)!.shipping)
                  ),
                  SalomonBottomBarItem(
                      icon: const Icon(Icons.person),
                      title: Text(AppLocalizations.of(context)!.profile)
                  ),
                ],
              ),
            ),
          );
      }
    );
  }
}