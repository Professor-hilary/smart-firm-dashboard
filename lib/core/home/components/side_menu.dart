import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartlab/core/constants/color_constants.dart';

class SideMenu extends StatelessWidget {
  final Function(int) onMenuItemSelected;
  const SideMenu({super.key, required this.onMenuItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white30,
                    shape: BoxShape.circle,
                  ),
                  width: 70,
                  height: 70,
                  child: Image.asset(
                    "assets/images/logo-crane.png",
                    scale: 5,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                const Expanded(
                  child: Text(
                    "Water Research Center",
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "Home",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () => onMenuItemSelected(0),
          ),
          DrawerListTile(
            title: "Content",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () => onMenuItemSelected(1),
          ),
          DrawerListTile(
            title: "Analytics",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => onMenuItemSelected(2),
          ),
          DrawerListTile(
            title: "End User",
            svgSrc: "assets/icons/menu_task.svg",
            press: () => onMenuItemSelected(3),
          ),
          DrawerListTile(
            title: "Revenue",
            svgSrc: "assets/icons/money_bag.svg",
            press: () => onMenuItemSelected(4),
          ),
          DrawerListTile(
            title: "Partners",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => onMenuItemSelected(5),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DrawerListTile(
              press: () {
                if (kDebugMode) {
                  print("This is settings page");
                }
              },
              title: "Settings",
              svgSrc: "assets/icons/setting-2-svgrepo-com.svg",
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      onTap: press,
      horizontalTitleGap: 10.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: SvgPicture.asset(
          svgSrc,
          colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
          height: 16,
        ),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
