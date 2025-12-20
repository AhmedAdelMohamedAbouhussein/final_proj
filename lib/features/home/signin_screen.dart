import 'package:final_proj/core/resources/app_icons.dart';
import 'package:final_proj/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_proj/features/home/add_card.dart';
import 'package:final_proj/features/home/search_screen.dart';
class SigninScreen extends StatelessWidget 
{
    const SigninScreen({super.key});
    @override
    Widget build(BuildContext context) 
    {
      return Scaffold
      (
        body: Column
        (
          children: 
          [
            Align
            (
              alignment: Alignment.topCenter,
              child: Stack
              (
                alignment: Alignment.center,
                children: 
                [
                  Image.asset(AppIcons.signupWelcome),
                  Image.asset(AppIcons.splashLogo),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text
            (
              'Food delivered to you',
              style: GoogleFonts.robotoCondensed
              (
                color: Color.fromARGB(255,0, 200, 116),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text
            (
              'Please enter your phone number to continue.',
              style: GoogleFonts.robotoCondensed
              (
                color: Color.fromARGB(255,255,255,255),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),    
            Padding
            (
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField
              (
                maxLength: 11,
                decoration: InputDecoration
                (
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  border: OutlineInputBorder
                  (
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixText: '+20 | ',
                  counterText: ''
                ),
                style: GoogleFonts.robotoCondensed
                (
                  color: Color.fromARGB(255,255,255,255),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10), 
            ElevatedButton
            (
              onPressed: () 
              {
                Navigator.pushReplacement
                (
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom
              (
                  backgroundColor: const Color.fromARGB(255, 0, 200, 116),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(20),
                  ),
              ),
              child: Text
              (
                'Continue',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }
}