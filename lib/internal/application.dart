import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        '/promotions': (context) => const Promotions(),
        '/menu': (context) => const Menu(),
        '/basket': (context) => const Basket(),
        '/profile': (context) => const Profile(),
      },
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/percent.svg',
                colorFilter: _selectedIndex == 0 ? const ColorFilter.mode(Colors.orange, BlendMode.srcIn) : null,
              ),
              label: 'Акции',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/burger.svg',
                colorFilter: _selectedIndex == 1 ? const ColorFilter.mode(Colors.orange, BlendMode.srcIn) : null,
              ),
              label: 'Меню',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/basket.svg',
                colorFilter: _selectedIndex == 2 ? const ColorFilter.mode(Colors.orange, BlendMode.srcIn) : null,
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: _selectedIndex == 3 ? const ColorFilter.mode(Colors.orange, BlendMode.srcIn) : null,
              ),
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
