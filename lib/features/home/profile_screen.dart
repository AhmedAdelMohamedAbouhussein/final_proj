import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/resources/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          const CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 16),

          // Name using your project's Font style
          Text(
            'Vlad S.',
            style: GoogleFonts.robotoCondensed(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 40),

          // Menu Items
          _buildMenuItem(Icons.tune, 'Settings'),
          const SizedBox(height: 10),
          _buildMenuItem(Icons.chat_bubble_outline, 'Contact us'),
          const SizedBox(height: 10),
          _buildMenuItem(Icons.info_outline, 'Help center'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        // Handle navigation here
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: GoogleFonts.robotoCondensed(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}