import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData icon;

  const CustomAppBar({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xff32AA90),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
