import 'package:flutter/material.dart';
import 'package:flutter_app_demo/SupportFiles/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 49, 69),
      appBar: AppBar(
        title: Text(
          Constants.homePageTitle,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 5, 10, 0),
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/PTlogo.jpg"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text(
                      Constants.instructionLabelText,
                      style: GoogleFonts.butterflyKids(
                        fontSize: Constants.lagreTextFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/noteBgNew.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 25, 15, 5),
                  child: Text(
                    Constants.rulesLabelText,
                    style: GoogleFonts.comingSoon(
                      color: Colors.black,
                      fontSize: Constants.rulesFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                  height: 35,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 170, 0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/playpage');
                    },
                    child: Text(
                      Constants.startBtnText,
                      style: GoogleFonts.comingSoon(
                        fontSize: Constants.buttonFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
