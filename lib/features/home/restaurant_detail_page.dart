import 'package:final_proj/core/models/restaurant_model.dart';
import 'package:final_proj/features/home/cart_manager.dart';
import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';
import 'cart_screen.dart';

class RestaurantDetailPage extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  // Use the menu data directly from the passed model
  late List<MenuItemModel> localMenu;

  @override
  void initState() {
    super.initState();
    localMenu = widget.restaurant.menu;
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = localMenu.fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: AppColors.globalDarkMode,
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(context),
              const SizedBox(height: 12),
              _buildInfoSection(),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120),
                  itemCount: localMenu.length,
                  itemBuilder: (context, index) {
                    return _menuItemRow(localMenu[index]);
                  },
                ),
              ),
            ],
          ),

          if (totalItems > 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomCartButton(totalItems),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.restaurant.image,
          height: 240,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Container(height: 240, color: Colors.grey[900]),
        ),
        Positioned(
          top: 44,
          left: 16,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.restaurant.title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            "${widget.restaurant.rating} (${widget.restaurant.reviews} Reviews) • ${widget.restaurant.distance} • ${widget.restaurant.time}",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _menuItemRow(MenuItemModel item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.image,
              width: 75,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 75, height: 75, color: Colors.grey[800],
                child: const Icon(Icons.fastfood, color: Colors.white24),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Colors.greenAccent),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _quantityController(item),
        ],
      ),
    );
  }

  Widget _quantityController(MenuItemModel item) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F26),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (item.quantity > 0)
            IconButton(
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.remove, color: Colors.green, size: 18),
              onPressed: () => setState(() => item.quantity--),
            ),
          if (item.quantity > 0)
            Text("${item.quantity}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          IconButton(
            visualDensity: VisualDensity.compact,
            icon: const Icon(Icons.add, color: Colors.green, size: 18),
            onPressed: () => setState(() => item.quantity++),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomCartButton(int count) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      decoration: BoxDecoration(
        color: AppColors.globalDarkMode,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 15, offset: const Offset(0, -5))],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: () {
          List<CartItem> selectedItems = localMenu
              .where((item) => item.quantity > 0)
              .map((item) => CartItem(
            name: item.name,
            image: item.image,
            price: item.price,
            quantity: item.quantity,
          ))
              .toList();

          CartManager().addItems(selectedItems);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Added to Order!"), backgroundColor: Colors.green),
          );

          setState(() {
            for (var item in localMenu) { item.quantity = 0; }
          });
        },
        child: Text("Add $count items to cart", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}