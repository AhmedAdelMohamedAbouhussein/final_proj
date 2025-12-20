import 'package:flutter/material.dart';

class NavItem {
  final IconData icon; // Changed from String
  final String label;
  final Widget page;

  NavItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}
