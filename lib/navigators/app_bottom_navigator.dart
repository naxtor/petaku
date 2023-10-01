import 'package:flutter/material.dart';
import 'package:mp_tp_2/providers/app_provider.dart';
import 'package:mp_tp_2/screens/home_screen.dart';
import 'package:mp_tp_2/screens/map_screen.dart';
import 'package:mp_tp_2/screens/user_form_screen.dart';
import 'package:provider/provider.dart';

class AppBottomNavigator extends StatefulWidget {
  const AppBottomNavigator({super.key});

  @override
  State<AppBottomNavigator> createState() => _AppBottomNavigatorState();
}

class _AppBottomNavigatorState extends State<AppBottomNavigator> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const UserFormScreen(),
    const MapScreen(),
  ];
  final List<String> _titles = [
    'Home',
    'User Form',
    'Map',
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.sticky_note_2,
    Icons.map_outlined,
  ];
  int _screenIndex = 0;

  void _onMenuTapped(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<AppProvider>(
          builder: (context, value, child) {
            return Text(
              value.userName.isEmpty ? 'Guest' : value.userName,
            );
          },
        ),
      ),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _screenIndex,
        onTap: _onMenuTapped,
        items: List.generate(_titles.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              _icons[index],
            ),
            label: _titles[index],
          );
        }),
      ),
    );
  }
}
