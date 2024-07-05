import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/app_colors.dart';
import 'package:quiz_app/quiz_controller.dart';

import '../question.dart';

QuizController qc = QuizController();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

List<Icon> scoreTracker = [];

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userAnswer) {
    setState(() {
      if (qc.isEnded() == true) {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: 'Quiz Complete!!!',
            confirmBtnText: 'Platy Again',
            confirmBtnColor: AppColors.selectedColor,
            cancelBtnText: 'Quit',
            showCancelBtn: true,
            onCancelBtnTap: () {
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
              qc.reset();
            },
            onConfirmBtnTap: () {
              Navigator.pop(context);

            });
        scoreTracker = [];
        qc.reset();
      } else {
        if (userAnswer == qc.getCorrectAnswer) {
          scoreTracker.add(
            Icon(
              Icons.check_circle,
              color: AppColors.selectedColor,
            ),
          );
        } else {
          scoreTracker.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        qc.nextQuestio();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.gradientColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Center(
          child: Text(
            'Quizzle',
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 24),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    qc.getQuestion,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.selectedColor),
                  child: Text(
                    'TRUE',
                    style: GoogleFonts.nunito(
                      color: AppColors.bgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(
                    'FALSE',
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: scoreTracker,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
