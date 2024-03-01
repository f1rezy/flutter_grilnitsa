class Promotions {
  final int count;
  final List promotions;

  Promotions({required this.count, required this.promotions});

  factory Promotions.fromJson(Map<String, dynamic> json) {
    return Promotions(
      count: json['count'] as int,
      promotions: json['promotions'] as List,
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'promotions': promotions,
      };
}

class Promotion {
  final String path;
  final int id;

  Promotion({required this.path, required this.id});

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      path: json['path'] as String,
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'path': path,
        'id': id,
      };
}
