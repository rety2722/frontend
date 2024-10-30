import 'package:flutter/material.dart';
import 'package:webapp_frontend/widgets/info_card.dart';
import 'package:webapp_frontend/widgets/side_menu_tile.dart';

class SideMenuBar extends StatefulWidget {
  const SideMenuBar({super.key});

  @override
  State<SideMenuBar> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<SideMenuBar> {
  SideMenuTileData selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Colors.pinkAccent,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: "Full name",
                message: "Flutter is cool",
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 16),
                child: Text(
                  "Contents",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  press: () {
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<SideMenuTileData> sideMenus = [
  SideMenuTileData(icon: Icons.home, text: "Home"),
  SideMenuTileData(icon: Icons.history, text: "History"),
  SideMenuTileData(icon: Icons.favorite, text: "Liked"),
  SideMenuTileData(icon: Icons.settings, text: "Settings")
];