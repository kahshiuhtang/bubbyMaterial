import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.account_circle_rounded),
      elevation: 10,
      title: Text(
        "bubby material",
        style: TextStyle(
            color: Color(0xffFFFFFFF),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
      ),
      actions: [Icon(Icons.more_vert)],
      backgroundColor: Color.fromARGB(255, 124, 108, 119),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
