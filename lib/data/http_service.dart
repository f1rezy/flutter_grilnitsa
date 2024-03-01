import 'dart:convert';
import 'package:http/http.dart';
import 'api/model/promotions.dart';
import 'api/model/dish.dart';

class HttpService {
  final promotionsURL = Uri.parse('http://5.35.99.154:8080/api/promotion/');
  final typesURL = Uri.parse('http://5.35.99.154:8080/api/dish/types');

  Future<List<Promotion>> getPromotions() async {
    Response res = await get(promotionsURL);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      List<dynamic> promotions = Promotions.fromJson(body).promotions;

      List<Promotion> promotionsList = promotions
          .map(
            (dynamic item) => Promotion.fromJson(item),
          )
          .toList();

      return promotionsList;
    } else {
      throw "Unable to retrieve promotions.";
    }
  }

  Future<List<String>> getTypes() async {
    Response res = await get(typesURL);

    if (res.statusCode == 200) {
      List<String> types = json.decode(utf8.decode(res.bodyBytes));

      return types;
    } else {
      throw "Unable to retrieve promotions.";
    }
  }

  Future<List<Dish>> getDishesByType(String type) async {
    Response res = await get(
        Uri.parse('http://5.35.99.154:8080/api/dish/byType?type=$type'));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

      List<Dish> dishes = body
          .map(
            (dynamic item) => Dish.fromJson(item),
          )
          .toList();

      return dishes;
    } else {
      throw "Unable to retrieve dishes.";
    }
  }
}
