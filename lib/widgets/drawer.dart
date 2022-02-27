// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final onTap;
  NavigationDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white30,
              foregroundColor: Colors.black,
              title: Text("Keep Going..."),
            ),
            ListTile(
              title: Text("Quiz 2"),
              subtitle: Text(
                "Complete your quiz",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
