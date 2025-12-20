import 'package:final_proj/features/home/add_card.dart';
import 'package:final_proj/features/home/home_content.dart';
import 'package:final_proj/features/home/search_screen.dart';

import 'package:final_proj/features/home/uiModel/NavItems.dart';

import 'package:flutter/material.dart';

import '../features/home/profile_screen.dart';

class AppUiConstants {
  const AppUiConstants._();

  static List<NavItem> bottomNavItems = [
    NavItem(icon: Icons.home, label: 'Home', page: const HomeContent()),
    NavItem(icon: Icons.search, label: 'Browse', page: const SearchScreen()),
    NavItem(icon: Icons.bookmark, label: 'Orders', page: const AddCard()),
    NavItem(icon: Icons.person, label: 'Profile', page: ProfileScreen()),
  ];
}