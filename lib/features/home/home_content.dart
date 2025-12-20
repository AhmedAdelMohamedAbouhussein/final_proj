import 'package:flutter/material.dart';
import '../../core/resources/app_colors.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          _topBar(),
          const SizedBox(height: 16),
          _searchBar(),
          const SizedBox(height: 18),
          _categories(),
          const SizedBox(height: 24),
          _sectionTitle("Fastest"),
          const SizedBox(height: 12),
          _fastestList(),
          const SizedBox(height: 28),
          _sectionTitle("Recommended for You"),
          const SizedBox(height: 12),
          _recommendedCard(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Color(0xFF22C55E)),
        const SizedBox(width: 6),
        const Text(
          "Wherever You Want",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.iconBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Food, groceries, etc.",
          prefixIcon: Icon(Icons.search),
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryItem(icon: Icons.verified, title: "Acclaimed", active: true),
          CategoryItem(icon: Icons.local_florist, title: "Healthy"),
          CategoryItem(icon: Icons.local_pizza, title: "Pizza"),
          CategoryItem(icon: Icons.ramen_dining, title: "Ramen"),
          CategoryItem(icon: Icons.lunch_dining, title: "Burger"),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _fastestList() {
    return SizedBox(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FoodCard(
            image:
            "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe",
            title: "Morning Delights Café",
            rating: "4.9",
            reviews: "103",
            distance: "2.3km",
            time: "25 min",
          ),
          FoodCard(
            image:
            "https://images.unsplash.com/photo-1529042410759-befb1204b468",
            title: "Sunrise Eats",
            rating: "4.8",
            reviews: "561",
            distance: "2.3km",
            time: "25 min",
          ),
        ],
      ),
    );
  }

  Widget _recommendedCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://images.unsplash.com/photo-1544025162-d76694265947",
        height: 180,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

// ───────────────────────── CATEGORY ITEM ─────────────────────────
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;

  const CategoryItem(
      {super.key, required this.icon, required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: active ? AppColors.greenIcon : AppColors.iconBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: active ? Colors.white : Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: active ? AppColors.greenIcon : AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ───────────────────────── FOOD CARD ─────────────────────────
class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String reviews;
  final String distance;
  final String time;

  const FoodCard(
      {super.key,
        required this.image,
        required this.title,
        required this.rating,
        required this.reviews,
        required this.distance,
        required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: SizedBox(
        width: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                height: 140,
                width: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.whiteColor,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  "$rating ($reviews)",
                  style: const TextStyle(
                      fontSize: 12, color: AppColors.whiteColor),
                ),
                const SizedBox(width: 8),
                Text("• $distance • $time",
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.whiteColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
