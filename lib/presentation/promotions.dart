import 'package:flutter/material.dart';
import 'package:flutter_grilnitsa/data/http_service.dart';
import 'package:flutter_grilnitsa/data/api/model/promotions.dart';

class Promotions extends StatefulWidget {
  const Promotions({super.key});

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: httpService.getPromotions(),
      builder: (BuildContext context, AsyncSnapshot<List<Promotion>> snapshot) {
        if (snapshot.hasData) {
          List<Promotion>? promotions = snapshot.data;
          return ListView(
            padding: const EdgeInsets.all(10.0),
            children: promotions!.map(
              (Promotion promotion) {
                String path = promotion.path;
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.network('http://5.35.99.154:8080$path'),
                  ),
                );
              },
            ).toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
