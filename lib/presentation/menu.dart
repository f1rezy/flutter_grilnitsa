import 'package:flutter/material.dart';
import 'package:flutter_grilnitsa/data/api/model/dish.dart';
import 'package:flutter_grilnitsa/data/http_service.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TabBar.secondary(
              labelColor: Colors.deepOrange,
              indicatorColor: Colors.deepOrange,
              tabs: [
                Tab(
                  text: 'ШАУРМА',
                ),
                Tab(
                  text: 'ПИЦЦА',
                ),
                Tab(
                  text: 'РОЛЛЫ',
                ),
                Tab(
                  text: 'СЕТ',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                FutureBuilder(
                  future: httpService.getDishesByType('ШАУРМА'),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Dish>> snapshot) {
                    if (snapshot.hasData) {
                      List<Dish>? dishes = snapshot.data;
                      return ListView(
                        padding: const EdgeInsets.all(10.0),
                        children: dishes!.map(
                          (Dish dish) {
                            return Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 0.5),
                                  ],
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(dish.name),
                                        Text(dish.weight.toString() + ' г')
                                      ],
                                    ),
                                    Image.network(
                                        'http://5.35.99.154:8080/api/dish/' +
                                            dish.id.toString() +
                                            '/image'),
                                    Text(
                                      dish.ingredients.join(', '),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    ElevatedButton(
                                      child: Text(dish.price.toString() + ' ₽'),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 160)),
                                    ),
                                  ],
                                ));
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                FutureBuilder(
                  future: httpService.getDishesByType('ПИЦЦА'),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Dish>> snapshot) {
                    if (snapshot.hasData) {
                      List<Dish>? dishes = snapshot.data;
                      return ListView(
                        padding: const EdgeInsets.all(10.0),
                        children: dishes!.map(
                          (Dish dish) {
                            return Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 0.5),
                                  ],
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(dish.name),
                                        Text(dish.weight.toString() + ' г')
                                      ],
                                    ),
                                    Image.network(
                                        'http://5.35.99.154:8080/api/dish/' +
                                            dish.id.toString() +
                                            '/image'),
                                    Text(
                                      dish.ingredients.join(', '),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    ElevatedButton(
                                      child: Text(dish.price.toString() + ' ₽'),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 160)),
                                    ),
                                  ],
                                ));
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                FutureBuilder(
                  future: httpService.getDishesByType('РОЛЛЫ'),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Dish>> snapshot) {
                    if (snapshot.hasData) {
                      List<Dish>? dishes = snapshot.data;
                      return ListView(
                        padding: const EdgeInsets.all(10.0),
                        children: dishes!.map(
                          (Dish dish) {
                            return Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 0.5),
                                  ],
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(dish.name),
                                        Text(dish.weight.toString() + ' г')
                                      ],
                                    ),
                                    Image.network(
                                        'http://5.35.99.154:8080/api/dish/' +
                                            dish.id.toString() +
                                            '/image'),
                                    Text(
                                      dish.ingredients.join(', '),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    ElevatedButton(
                                      child: Text(dish.price.toString() + ' ₽'),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 160)),
                                    ),
                                  ],
                                ));
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                FutureBuilder(
                  future: httpService.getDishesByType('CЕТ'),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Dish>> snapshot) {
                    if (snapshot.hasData) {
                      List<Dish>? dishes = snapshot.data;
                      return ListView(
                        padding: const EdgeInsets.all(10.0),
                        children: dishes!.map(
                          (Dish dish) {
                            return Container(
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 0.5),
                                  ],
                                ),
                                margin: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(dish.name),
                                        Text(dish.weight.toString() + ' г')
                                      ],
                                    ),
                                    Image.network(
                                        'http://5.35.99.154:8080/api/dish/' +
                                            dish.id.toString() +
                                            '/image'),
                                    Text(
                                      dish.ingredients.join(', '),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    ElevatedButton(
                                      child: Text(dish.price.toString() + ' ₽'),
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.deepOrangeAccent,
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 160)),
                                    ),
                                  ],
                                ));
                          },
                        ).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ]),
            ),
          ],
        ));
  }
}
