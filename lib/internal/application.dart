import 'package:flutter/material.dart';
import 'package:flutter_grilnitsa/presentation/basket.dart';
import 'package:flutter_grilnitsa/presentation/menu.dart';
import 'package:flutter_grilnitsa/presentation/profile.dart';
import 'package:flutter_grilnitsa/presentation/promotions.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Promotions(),
    const Menu(),
    const Basket(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Грильница',
      theme: ThemeData.light(),
      routes: {
        '/promotions': (context) => const Promotions(),
        '/menu': (context) => const Menu(),
        '/basket': (context) => const Basket(),
        '/profile': (context) => const Profile(),
      },
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.percent),
              label: 'Акции',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Меню',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange[800],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
