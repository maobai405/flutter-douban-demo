import 'package:flutter/material.dart';

class Tabbar extends BottomNavigationBarItem {
  Tabbar(String iconName, String labelName)
      : super(
          icon: Image.asset(
            'assets/images/tabbar/$iconName.png',
            width: 30,
          ),
          activeIcon: Image.asset(
            'assets/images/tabbar/${iconName}_active.png',
            width: 30,
          ),
          label: labelName,
        );
}
