// contains route names

import 'package:final_proj/core/resources/app_colors.dart';
import 'package:final_proj/features/home/add_card.dart';
import 'package:final_proj/features/home/home_content.dart';
import 'package:final_proj/features/home/profile_screen.dart';
import 'package:final_proj/features/home/search_screen.dart';
import 'package:final_proj/features/home/signin_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  Routes._();
  static const String signupRoute = '/';
  static const String homeRoute = '/home';
  static const String browseRoute = '/browse';
  static const String profileRoute = '/profile';
  static const String orderRoute = '/order';
}

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.signupRoute:
        return MaterialPageRoute(builder: (context) => SigninScreen(),);
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (context) => HomeContent(),);
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (context) => ProfileScreen(),);
      case Routes.browseRoute:
        return MaterialPageRoute(builder: (context) => SearchScreen(),);
      case Routes.orderRoute:
        return MaterialPageRoute(builder: (context) => AddCard(),);
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute()
  {
    return MaterialPageRoute(builder: (context) => Scaffold(backgroundColor: AppColors.whiteColor, body: Center(child: Text('Route not defined'),),),);
  }
}