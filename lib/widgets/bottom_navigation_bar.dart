import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildBottomNavigationBar() {
  return DefaultTextStyle(
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: 'RFDewi',
    ),
    child: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_list_fill),
          label: 'Заявки',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Головна',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person_solid,
          ),
          label: 'Особисті дані',
        ),
      ],
      selectedItemColor: const Color.fromARGB(
          255, 255, 255, 255), // Set the selected item color
      unselectedItemColor:
          const Color(0xFF6E6E6E), // Set the unselected item color
      currentIndex: 1, // Set the initial selected index, change as needed
      onTap: (index) {
        // Handle bottom navigation item taps
      },
      showSelectedLabels: true, // Show labels for selected items
      showUnselectedLabels: true, // Show labels for unselected items
      type: BottomNavigationBarType
          .fixed, // Use fixed type to display all labels
      selectedLabelStyle: const TextStyle(
        fontFamily: 'SFPro',
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      ),
      selectedIconTheme: const IconThemeData(
        // Customize the icon theme for the selected item
        size: 28.0,
      ),
    ),
  );
}
