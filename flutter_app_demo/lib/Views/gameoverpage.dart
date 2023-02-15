import 'package:flutter/material.dart';
import 'package:flutter_app_demo/SupportFiles/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverPage extends StatelessWidget {
  getIQStatus() {
    if (score >= 8) {
      return Constants.excellentLabelText;
    } else if (score >= 4) {
      return Constants.goodLabelText;
    } else {
      return Constants.avgLabelText;
    }
  }

  final score;
  const GameOverPage(this.score, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 49, 69),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          Constants.gameOverTitle,
          style: GoogleFonts.comingSoon(
            fontSize: Constants.appTiteFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 170, 0),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                getIQStatus(),
                style: GoogleFonts.comingSoon(
                  fontSize: Constants.appTiteFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                'Your Score : ${score.toString()} / 10',
                style: GoogleFonts.comingSoon(
                  fontSize: Constants.appTiteFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child:
               ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 170, 0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                    },
                    child: Text(
                      Constants.homeBtnText,
                      style: GoogleFonts.comingSoon(
                        fontSize: Constants.buttonFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
          ],
        ),
      )),
    );
  }
}
