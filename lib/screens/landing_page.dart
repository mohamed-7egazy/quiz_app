import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/app_colors.dart';
import 'package:quiz_app/screens/quiz_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgColor,
              AppColors.gradientColor,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Quizzles',
              style: GoogleFonts.nunito(
                color: AppColors.selectedColor,
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Let\'s Play!!!',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Play now and have fun',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              width: size.width * 0.8,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.selectedColor,
                  backgroundColor: AppColors.buttonColor,
                ),
                child: Text(
                  'Play Now',
                  style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(name: 'Landing Page'),
                      builder: (context) => const QuizPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
