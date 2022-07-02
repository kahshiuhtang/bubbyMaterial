import 'package:flutter/material.dart';
import 'package:ptr/screens/profileScreen/ProfileScreen.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    Key? key,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined)),
      elevation: 10,
      title: Text("Profile",
          style: TextStyle(
            color: Color(0xffFFFFFFF),
            fontWeight: FontWeight.bold,
          )),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10), child: Icon(Icons.settings)),
      ],
      backgroundColor: Color.fromARGB(255, 124, 108, 119),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
