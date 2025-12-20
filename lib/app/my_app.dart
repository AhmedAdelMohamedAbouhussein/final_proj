import 'package:final_proj/core/resources/app_colors.dart';
import 'package:final_proj/core/resources/app_router.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.globalDarkMode),
        initialRoute: Routes.signupRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}