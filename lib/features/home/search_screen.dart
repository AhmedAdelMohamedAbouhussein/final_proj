import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  final List<Map<String, String>> categories = const [
    {'name': 'Ramen', 'icon': 'assets/Icons/View/ramen_dining.png'},
    {'name': 'Pizza', 'icon': 'assets/Icons/View/local_pizza.png'},
    {'name': 'Fast Food', 'icon': 'assets/Icons/View/fastfood.png'},
    {'name': 'Healthy', 'icon': 'assets/Icons/View/nutrition.png'},
    {'name': 'Salads', 'icon': 'assets/Icons/View/nutrition.png'},
    {'name': 'Desserts', 'icon': 'assets/Icons/View/nutrition.png'},
    {'name': 'Meat', 'icon': 'assets/Icons/View/nutrition.png'},
    {'name': 'Asian', 'icon': 'assets/Icons/View/nutrition.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.globalDarkMode,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Search',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Food, groceries, etc.',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),

              // Categories title
              Text(
                'Categories',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),

              // Grid of categories
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3 / 2, // shorter boxes
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Material(
                      color: AppColors.searchBtnColor,
                      borderRadius: BorderRadius.circular(12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          // Action when the category is clicked
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Clicked ${category['name']}')),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                category['icon']!,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                category['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
