import 'package:flutter/material.dart';

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Builder(
        builder: (builderContext) => IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xff273E47),
          ),
          onPressed: () {
            Scaffold.of(builderContext).openEndDrawer();
          },
        ),
      ),
    );
  }
}
