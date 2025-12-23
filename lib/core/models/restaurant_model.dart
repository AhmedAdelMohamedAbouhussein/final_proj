class MenuItemModel {
  final String name;
  final double price;
  final String image;
  int quantity; // This will track state in the UI

  MenuItemModel({
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 0,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'] ?? '',
    );
  }
}

class RestaurantModel {
  final String id;
  final String title;
  final String image;
  final String rating;
  final String reviews;
  final String distance;
  final String time;
  final String category;
  final List<MenuItemModel> menu;

  RestaurantModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.time,
    required this.category,
    required this.menu,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating']?.toString() ?? '0.0',
      reviews: json['reviews']?.toString() ?? '0',
      distance: json['distance'] ?? '',
      time: json['time'] ?? '',
      category: json['category'] ?? '',
      menu: (json['menu'] as List?)
          ?.map((item) => MenuItemModel.fromJson(item))
          .toList() ?? [],
    );
  }
}