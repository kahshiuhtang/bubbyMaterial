import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptr/screens/profileScreen/ProfileScreen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);
  logOut() async {
    FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          },
          child: Icon(Icons.account_circle_rounded)),
      elevation: 10,
      title: Text(
        "bubby material",
        style: TextStyle(
            color: Color(0xffFFFFFFF),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto'),
      ),
      actions: [IconButton(onPressed: logOut, icon: Icon(Icons.more_vert))],
      backgroundColor: Color.fromARGB(255, 124, 108, 119),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
